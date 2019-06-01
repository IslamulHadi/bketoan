import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class InitLogin extends LoginEvent {
  InitLogin() : super([]);
}

class LoginButtonPressed extends LoginEvent {
  final Map<String, dynamic> params;

  LoginButtonPressed({@required this.params}) : super([params]);
}

class LoginBySocialmedia extends LoginEvent {
  final Map<String, dynamic> params;

  LoginBySocialmedia({@required this.params}) : super([params]);
}

class RegisterAccount extends LoginEvent {
  final Map<String, dynamic> params;

  RegisterAccount({@required this.params}) : super([params]);
}
