import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/constants/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:go_router/go_router.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void>setSplash({BuildContext? context})async{
    Future.delayed(Duration(seconds: 5), () {
      context?.push(onboardingSc);
    });
  }

}
