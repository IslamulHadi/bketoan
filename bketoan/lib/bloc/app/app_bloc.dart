import 'dart:async';
import 'package:bketoan/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class AppBloc extends BlocBase {
  final _eventCtrl = StreamController<AppEvent>();
  Sink<AppEvent> get eventCtrl => _eventCtrl.sink;

  AppBloc() {
    _pageIndex.sink.add(_currentIndex);
    _eventCtrl.stream.listen(handleEvent);
  }

  int _currentIndex = 0;
  final _pageIndex = BehaviorSubject<int>();
  Observable<int> get pageIndex => _pageIndex.stream;

  @override
  void dispose() {
    _eventCtrl.close();
    _pageIndex.close();
  }

  @override
  void handleEvent(event) {
    if (event is SetPageIndex) {
      _currentIndex = event.index;
      _pageIndex.sink.add(_currentIndex);
    }
  }
}
