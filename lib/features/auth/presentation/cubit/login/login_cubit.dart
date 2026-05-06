import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/auth/domain/entities/login/login.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../injection_container/injection_container.dart';
import '../../../../../main.dart';
import '../../../domain/entities/login/login_params.dart';
import '../../../domain/usecases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  TabController? tabController;
  int? ind=0;
  bool? isChecked = false;
  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>setTabController({required TickerProvider ticker})async{
    tabController = TabController(length: 2, vsync: ticker);
  }

  Future<void>signIn({LoginParams? params,})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(LoginLoading());
      final failOrUser = await loginUseCase(params!);
      failOrUser.fold((fail){
        if(fail is ServerFailure){
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(fail.message,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
          loading = false;
          error = true;
          success = false;
          emit(LoginError(message: fail.message));
        }
      }, (response)async{
        loading = false;
       error = false;
        success = true;
        if(response.success == true){
          if(response.data!.user!.isVerified == false){
          /*  navKey.currentContext!.pushNamed(name: otpSc,args: OtpParams(
                email: params.email
            ));*/
          }else {
            await sharedPreferences.setString("pass", params.password!);
            await sharedPreferences.setBool("user", true);

            msgKey.currentState!.showSnackBar
              (SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(response.message!,
                  style: TextStyles.textStyleNormal12
                      .copyWith(color: white),textScaler: TextScaler.linear(1),)));
           /*

            navKey.currentContext!.pushReplacementNamed(name: bottomBarSc);*/
          }
        }else {
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(response.message!,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        }


        emit(LoginSuccess(loginResponse: response));
      });
    }catch(e){
      loading = false;
      error = true;
      success = false;

      msgKey.currentState!.showSnackBar
        (SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString(),
            style: TextStyles.textStyleNormal12
                .copyWith(color: white),textScaler: TextScaler.linear(1),)));
      emit(LoginError(message: e.toString()));
    }
  }
  Future<void>updateTabState({required int val})async{
    ind = val;
    emit(UpdateTabLoginState());
  }
  Future<void>isTermsChecked({bool? value})async {

    isChecked = value!;
    /*if(value == true){
      acceptTerms = 1;
    }else {
      acceptTerms = 0;
    }*/

    emit(TermsCheckedState());
  }
}
