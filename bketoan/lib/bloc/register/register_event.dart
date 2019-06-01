import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);
}

class CheckPhoneAvailability extends RegisterEvent {
  final String phoneNumber;

  CheckPhoneAvailability(this.phoneNumber) : super([phoneNumber]);
}
