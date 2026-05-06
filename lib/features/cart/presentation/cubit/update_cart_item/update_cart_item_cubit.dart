import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/cart_params.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/usecases/update_cart_item_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'update_cart_item_state.dart';

class UpdateCartItemCubit extends Cubit<UpdateCartItemState> {
  UpdateCartItemCubit(this.updateCartItemUseCase) : super(UpdateCartItemInitial());
  final UpdateCartItemUseCase updateCartItemUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>updateCartItem({UpdateCartItemParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(UpdateCartItemLoading());
      final failOrUser = await updateCartItemUseCase(params!);
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
          emit(UpdateCartItemError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(UpdateCartItemSuccess());
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
