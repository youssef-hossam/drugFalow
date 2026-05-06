import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/cart/domain/usecases/cart_items_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../main.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  CartItemsCubit(this.cartItemsUseCase) : super(CartItemsInitial());
  final CartItemsUseCase cartItemsUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;
  TabController? tabController;
  int? index;



  Future<void>getCartItems()async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(CartItemsLoading());
      final failOrUser = await cartItemsUseCase(NoParams());
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
          emit(CartItemsError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;

        emit(CartItemsSuccess());
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
  Future<void>setTabBar({TickerProvider? provider})async{
    tabController = TabController(length: 2, vsync: provider!);
  }
  Future<void>updateTabIndex({int? ind})async{
    index = ind;
    emit(UpdateCartState());
  }
}
