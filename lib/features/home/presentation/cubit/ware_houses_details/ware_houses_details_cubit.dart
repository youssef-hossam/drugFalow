import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_params.dart';
import 'package:drug_flow/features/home/domain/usecases/ware_houses_details_use_case.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'ware_houses_details_state.dart';

class WareHousesDetailsCubit extends Cubit<WareHousesDetailsState> {
  WareHousesDetailsCubit(this.wareHousesDetailsUseCase) : super(WareHousesDetailsInitial());

  final WareHousesDetailsUseCase wareHousesDetailsUseCase;

  bool? loading = false;
  bool? error = false;
  bool success = false;


  Future<void>getWareHousesDetails({WareHouseParams? params})async{
    try{
      loading = true;
      error = false;
      success = false;
      emit(WareHousesDetailsLoading());
      final failOrUser = await wareHousesDetailsUseCase(params!);
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
          emit(WareHousesDetailsError(message: fail.message));
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


        emit(WareHousesDetailsSuccess());
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
