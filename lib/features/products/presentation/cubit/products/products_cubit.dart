import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/products/domain/entities/products/products_params.dart';
import 'package:drug_flow/features/products/domain/usecases/products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsUseCase) : super(ProductsInitial());
  final ProductsUseCase productsUseCase;
  TabController? tabController;

  bool? loading = false;
  bool? error = false;
  bool success = false;
  int? index =0;


  Future<void>getProducts({ProductsParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(ProductsLoading());
      final failOrUser = await productsUseCase(params!);
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
          emit(ProductsError());
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;


        emit(ProductsSuccess());
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
  Future<void>updateTabIndex({int? ind})async{
    index = ind;
    tabController!.animateTo(ind!);
    emit(UpdateTabState());
  }
}
