import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/usecases/cart_item_counts_use_case.dart';
import 'package:drug_flow/features/cart/domain/usecases/cart_items_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'cart_item_counts_state.dart';

class CartItemCountsCubit extends Cubit<CartItemCountsState> {
  CartItemCountsCubit(this.cartItemCountsUseCase) : super(CartItemCountsInitial());

  final CartItemCountsUseCase cartItemCountsUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>getCartItemCounts()async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(CartItemCountsLoading());
      final failOrUser = await cartItemCountsUseCase(NoParams());
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
          emit(CartItemCountsError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(CartItemCountsSuccess());
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
