import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/profile/domain/uesecases/fqa_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit(this.fqaUseCase) : super(FaqsInitial());
  final FqaUseCase fqaUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;

  Future<void>getFqa()async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(FaqsLoading());

      final failOrUser = await fqaUseCase(NoParams());
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
            error = true;
            success = false;
            failMsg = fail.message;
            emit(FaqsError());
          }

        },
            (response) {
          loading = false;
          error= false;
          success = true;


          emit(FaqsSuccess());
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
