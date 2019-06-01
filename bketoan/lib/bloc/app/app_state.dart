import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppState extends Equatable {
  AppState([List props = const []]) : super(props);
}

class InitialAppState extends AppState {}
