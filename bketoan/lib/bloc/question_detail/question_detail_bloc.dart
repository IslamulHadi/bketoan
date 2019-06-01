import 'dart:async';
import 'package:bketoan/bloc/bloc_base.dart';
import 'package:bketoan/bloc/question_detail/bloc.dart';
import 'package:rxdart/rxdart.dart';

class QuestionDetailBloc extends BlocBase {
  final _eventCtrl = StreamController<QuestionDetailEvent>();
  Sink<QuestionDetailEvent> get eventCtrl => _eventCtrl.sink;

  QuestionDetailBloc() {
    _eventCtrl.stream.listen(handleEvent);
  }

  final _questionStream = BehaviorSubject<Map<String, dynamic>>();
  Observable<Map<String, dynamic>> get question => _questionStream.stream;

  @override
  void dispose() {
    _eventCtrl.close();
    _questionStream.close();
  }

  @override
  void handleEvent(event) {
    if (event is GetQuestionDetail) {
      
    }
  }
}
