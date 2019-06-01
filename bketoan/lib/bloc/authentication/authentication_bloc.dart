import 'dart:async';
import 'dart:convert';

import 'package:bketoan/bloc/authentication/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc implements BlocBase {
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
      await Future.delayed(Duration(seconds: 2));
      final bool hasToken = await UserRepository.hasToken();
      if (hasToken) {
        String userString = await UserRepository.loadUser();
        user = User.fromJson(json.decode(userString));
        _authStateCtrl.sink.add(AuthenticationAuthenticated());
      } else {
        _authStateCtrl.sink.add(AuthenticationUnauthenticated());
      }
    }
    if (event is LoggedIn) {
      _authStateCtrl.sink.add(AuthenticationLoading());
      await UserRepository.persistToken(event.token);
      await UserRepository.persistUser(json.encode(event.user));
      user = User.fromJson(event.user);
      _authStateCtrl.sink.add(AuthenticationAuthenticated());
    }

    if (event is LoggedOut) {
      _authStateCtrl.sink.add(AuthenticationLoading());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String loginMethod = prefs.getString('loginMethod');
      if (loginMethod == 'google') {
        GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
            'https://www.googleapis.com/auth/contacts.readonly',
          ],
        );
        _googleSignIn.disconnect();
      }
      prefs.remove('loginMethod');
      // await UserRepository.deleteToken();
      _authStateCtrl.sink.add(AuthenticationUnauthenticated());
    }
  }

  @override
  void dispose() {
    _eventCtrl.close();
    _authStateCtrl.close();
  }
}
