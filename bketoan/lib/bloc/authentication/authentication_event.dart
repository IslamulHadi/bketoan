import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mitralaundry/models/user.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final Map<String, dynamic> user;

  LoggedIn({@required this.token, this.user}) : super([token, user]);
}

class LoggedOut extends AuthenticationEvent {}
