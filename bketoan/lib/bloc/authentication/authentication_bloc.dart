import 'dart:async';
import 'dart:convert';

import 'package:bketoan/bloc/authentication/bloc.dart';
import 'package:bketoan/bloc/bloc_base.dart';
import 'package:bketoan/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc implements BlocBase {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User user;

  final _eventCtrl = StreamController<AuthenticationEvent>();
  Sink<AuthenticationEvent> get authEvent => _eventCtrl.sink;

  final _authStateCtrl = BehaviorSubject<AuthenticationState>();
  Observable<AuthenticationState> get authState => _authStateCtrl.stream;

  AuthenticationBloc() {
    _eventCtrl.stream.listen(handleEvent);
  }

  @override
  handleEvent(event) async {
    if (event is AppStarted) {
      _authStateCtrl.sink.add(AuthenticationUnauthenticated());
    }
    if (event is LoggedIn) {
      _authStateCtrl.sink.add(AuthenticationLoading());
      user = User(
        displayName: event.user.displayName,
        email: event.user.email,
        photoUrl: event.user.photoUrl,
        uid: event.user.uid,
      );
      _authStateCtrl.sink.add(AuthenticationAuthenticated());
    }

    if (event is LoggedOut) {
      _authStateCtrl.sink.add(AuthenticationLoading());
      _googleSignIn.signOut();
      _authStateCtrl.sink.add(AuthenticationUnauthenticated());
    }
  }

  @override
  void dispose() {
    _eventCtrl.close();
    _authStateCtrl.close();
  }
}
