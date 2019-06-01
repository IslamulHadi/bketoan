import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppEvent extends Equatable {
  AppEvent([List props = const []]) : super(props);
}

class SetPageIndex extends AppEvent {
  final int index;

  SetPageIndex(this.index);
}
