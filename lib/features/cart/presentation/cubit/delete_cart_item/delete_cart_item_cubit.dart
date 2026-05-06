import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/cart_params.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/usecases/delete_cart_item_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'delete_cart_item_state.dart';

class DeleteCartItemCubit extends Cubit<DeleteCartItemState> {
  DeleteCartItemCubit(this.deleteCartItemUseCase) : super(DeleteCartItemInitial());

  final DeleteCartItemUseCase deleteCartItemUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>deleteCartItem({DeleteCartItemParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(DeleteCartItemLoading());
      final failOrUser = await deleteCartItemUseCase(params!);
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
          emit(DeleteCartItemError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(DeleteCartItemSuccess());
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
