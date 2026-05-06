import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/auth/domain/entities/register/register.dart';
import 'package:drug_flow/features/auth/domain/entities/register/register_params.dart';
import 'package:drug_flow/features/auth/domain/usecases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final RegisterUseCase registerUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>register({RegisterParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(RegisterLoading());
      final failOrUser = await registerUseCase(params!);
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
          emit(RegisterError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;
        if(response.success == true){

        }else {
          msgKey.currentState!.showSnackBar
            (SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(response.message!,
                style: TextStyles.textStyleNormal12
                    .copyWith(color: white),textScaler: TextScaler.linear(1),)));
        }


        emit(RegisterSuccess(registerResponse: response));
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
    //  emit(RegisterError(message: e.toString()));
    }
  }
}
