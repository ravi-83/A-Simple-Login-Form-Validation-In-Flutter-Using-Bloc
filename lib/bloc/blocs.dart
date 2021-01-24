import 'dart:async';
import 'validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with ValidationMixin {

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();



  //Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid=> CombineLatestStream.combine2(email,password, (e,p)=> true);

  //Change Data
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeEmail => _email.sink.add;


  String get passwordValue{
    return _password.value;
  }
  String get emailValue{
    return _email.value;
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
