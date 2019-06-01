import 'dart:async';

import 'package:mitralaundry/api/auth_api.dart';
import 'package:mitralaundry/bloc/authentication/authentication_bloc.dart';
import 'package:mitralaundry/bloc/authentication/bloc.dart';
import 'package:mitralaundry/bloc/bloc_base.dart';
import 'package:mitralaundry/bloc/login/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc implements BlocBase {
  final AuthenticationBloc _authenticationBloc;

  final _loginEvent = StreamController<LoginEvent>();
  Sink<LoginEvent> get loginEvent => _loginEvent.sink;

  final _loginState = BehaviorSubject<LoginState>();
  Observable<LoginState> get loginState => _loginState.stream;

  LoginBloc(this._authenticationBloc) {
    _loginEvent.sink.add(InitLogin());
    _loginEvent.stream.listen(handleEvent);
  }

  @override
  handleEvent(event) {
    if (event is LoginBySocialmedia) {
      _loginBySocialMedia(event);
    } else if (event is LoginButtonPressed) {
      _handleLogin(event);
    } else if (event is RegisterAccount) {
      _handleRegister(event);
    } else if (event is InitLogin) {
      _loginState.sink.add(LoginInitial());
    }
  }

  _handleRegister(RegisterAccount event) async {
    _loginState.sink.add(LoginLoading());
    Map<String, dynamic> response;
    try {
      response = await AuthApi.register(event.params);
      _loginState.sink.add(LoginLoaded());
      if (response['status'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('loginMethod', 'build-in');
        _authenticationBloc.authEvent.add(
          LoggedIn(
            token: response['token'],
            user: response['user_data'],
          ),
        );
      } else {
        _loginState.sink.add(LoginFailure(error: response['data']));
      }
    } catch (error) {
      _loginState.sink.add(LoginFailure(error: error.toString()));
    }
  }

  _handleLogin(LoginButtonPressed event) async {
    _loginState.sink.add(LoginLoading());
    Map<String, dynamic> response;

    try {
      response = await AuthApi.login(event.params);
      _loginState.sink.add(LoginLoaded());
      if (response['status'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('loginMethod', 'build-in');
        _authenticationBloc.authEvent.add(
          LoggedIn(
            token: response['token'],
            user: response['user_data'],
          ),
        );
      } else {
        _loginState.sink.add(LoginFailure(error: response['data']));
      }
    } catch (error) {
      _loginState.sink.add(LoginFailure(error: error.toString()));
    }
  }

  _loginBySocialMedia(LoginBySocialmedia event) async {
    _loginState.sink.add(LoginLoading());
    Map<String, dynamic> response;

    try {
      response = await AuthApi.loginBySocialMedia(event.params);
      _loginState.sink.add(LoginLoaded());
      if (response['status'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('loginMethod', 'google');
        _authenticationBloc.authEvent.add(LoggedIn(token: response['token']));
      } else {
        _loginState.sink.add(LoginFailure(error: response['data']));
      }
    } catch (error) {
      _loginState.sink.add(LoginFailure(error: error.toString()));
    }
  }

  @override
  void dispose() {
    _loginEvent.close();
    _loginState.close();
  }
}
