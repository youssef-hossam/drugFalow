import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon_params.dart';
import 'package:drug_flow/features/cart/domain/usecases/apply_coupon_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'apply_coupon_state.dart';

class ApplyCouponCubit extends Cubit<ApplyCouponState> {
  ApplyCouponCubit(this.applyCouponUseCase) : super(ApplyCouponInitial());

  final ApplyCouponUseCase applyCouponUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>applyCoupon({ApplyCouponParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ApplyCouponLoading());
      final failOrUser = await applyCouponUseCase(params!);
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
          emit(ApplyCouponError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(ApplyCouponSuccess());
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
