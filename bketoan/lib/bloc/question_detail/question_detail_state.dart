import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuestionDetailState extends Equatable {
  QuestionDetailState([List props = const []]) : super(props);
}

class InitialQuestionDetailState extends QuestionDetailState {}
