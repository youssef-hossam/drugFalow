import 'package:bloc/bloc.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact_us_params.dart';
import 'package:drug_flow/features/profile/domain/uesecases/contact_us_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsUseCase) : super(ContactUsInitial());
  final ContactUsUseCase contactUsUseCase;
  bool? loading = false;
  bool? error = false;
  bool? success = false;
  String? failMsg;

  Future<void>contact({ContactUsParams? params})async{
    try {
      loading = true;
      error = false;
      success = false;
      emit(ContactUsLoading());

      final failOrUser = await contactUsUseCase(params!);
      failOrUser.fold(
            (fail) {
          if(fail is ServerFailure){
            loading = false;
           error = true;
            success = false;
            failMsg = fail.message;
            emit(ContactUsError());
          }

        },
            (response) {
          loading = false;
          error= false;
          success = true;


          emit(ContactUsSuccess());
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
