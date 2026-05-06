import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact.dart';
import 'package:drug_flow/features/profile/domain/entities/contact_us/contact_us_params.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';

class ContactUsUseCase extends UseCase<ContactUsResponse,ContactUsParams>{
  final ProfileRepositories profileRepositories;

  ContactUsUseCase(this.profileRepositories);

  @override
  Future<Either<Failure, ContactUsResponse>> call(ContactUsParams params)async {
    return await profileRepositories.contact(params: params);
  }
}