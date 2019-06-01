import 'dart:async';
import 'package:mitralaundry/api/auth_api.dart';
import 'package:mitralaundry/bloc/bloc_base.dart';
import 'package:mitralaundry/bloc/register/bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends BlocBase {
  final _eventCtrl = StreamController<RegisterEvent>();
  Sink<RegisterEvent> get blocEvent => _eventCtrl.sink;

  final _isPhoneAvailable = BehaviorSubject<RegisterState>();
  Observable<RegisterState> get isPhoneAvailable => _isPhoneAvailable.stream;

  final _uiMessageStream = PublishSubject<Map<String, dynamic>>();
  Observable<Map<String, dynamic>> get uiMessage => _uiMessageStream.stream;

  RegisterBloc() {
    _eventCtrl.stream.listen(handleEvent);
  }

  @override
  void dispose() {
    _isPhoneAvailable.close();
    _eventCtrl.close();
    _uiMessageStream.close();
  }

  @override
  void handleEvent(event) {}

  // _checkPhoneNumberAvailability(CheckPhoneAvailability event) async {
  //   Map<String, dynamic> response;
  //   response = await AuthApi.register({'phone_number': event.phoneNumber});
  //   if (response['status'] == 'success') {
  //     if(response['data'] == true){
  //       _isPhoneAvailable.sink.add(response['data']);
  //     }
  //   } else {
  //     _uiMessageStream.sink.add({'status': })
  //   }
  // }
}
