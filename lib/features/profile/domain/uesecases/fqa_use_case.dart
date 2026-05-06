import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/profile/domain/entities/fqa.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';

class FqaUseCase extends UseCase<FqaResponse,NoParams>{
  final ProfileRepositories profileRepositories;

  FqaUseCase(this.profileRepositories);

  @override
  Future<Either<Failure, FqaResponse>> call(NoParams params) async{
    return await profileRepositories.getFqa();
  }
}