import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/home/domain/usecases/ware_houses_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../main.dart';

part 'ware_houses_state.dart';

class WareHousesCubit extends Cubit<WareHousesState> {
  WareHousesCubit(this.wareHousesUseCase) : super(WareHousesInitial());

  final WareHousesUseCase wareHousesUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>getWareHouses()async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(WareHousesLoading());
      final failOrUser = await wareHousesUseCase(NoParams());
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
          emit(WareHousesError(message: fail.message));
        }
      }, (response)async{
        loading = false;
        error = false;
        success = true;



        emit(WareHousesSuccess());
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
