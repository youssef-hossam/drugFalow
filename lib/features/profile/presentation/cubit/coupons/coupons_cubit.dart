import 'package:bloc/bloc.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/profile/domain/uesecases/coupons_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'coupons_state.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit(this.couponsUseCase) : super(CouponsInitial());

  final CouponsUseCase couponsUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;

  Future<void>getCoupons()async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(CouponsLoading());

      final failOrUser = await couponsUseCase(NoParams());
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error = true;
            success = false;
            failMsg = fail.message;
            emit(CouponsError());
          }

        },
            (response) {
          loading = false;
          error= false;
          success = true;


          emit(CouponsSuccess());
        },
      );
    } catch (e) {
      loading = false;
      error = true;
      success = false;
      failMsg = e.toString();
      // emit(FavouritesError());
    }
  }
}
