import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuestionDetailEvent extends Equatable {
  QuestionDetailEvent([List props = const []]) : super(props);
}

class GetQuestionDetail extends QuestionDetailEvent {}
