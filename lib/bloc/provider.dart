import 'package:flutter/material.dart';
import 'blocs.dart';

class Provider extends InheritedWidget{
  final bloc = Bloc();
  Provider({Key key,Widget child})
  : super(key: key,child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
   // throw UnimplementedError();

  }

  static Bloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).bloc;
  }

}