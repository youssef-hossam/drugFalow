
import 'package:flutter/cupertino.dart';



extension NavigatorHelper on BuildContext {

  void pushNamed({String? name, Object? args}){
    Navigator.of(this).pushNamed(name!,arguments: args);
  }
  void pushReplacementNamed({String? name, Object? args}){
    Navigator.of(this).pushReplacementNamed(name!,arguments: args);
  }
  void pushNamedAndRemoveUntil({String? name, Object? args}){
    Navigator.of(this).pushNamedAndRemoveUntil(name!
        ,(Route<dynamic> route) => false,arguments: args);
  }
  void pop(){
    Navigator.of(this).pop();
  }
}