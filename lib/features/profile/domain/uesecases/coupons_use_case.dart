import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';

class CouponsUseCase extends UseCase<CouponsResponse,NoParams>{
  final ProfileRepositories profileRepositories;

  CouponsUseCase(this.profileRepositories);

  @override
  Future<Either<Failure, CouponsResponse>> call(NoParams params)async {
    return await profileRepositories.getCoupons();
  }
}