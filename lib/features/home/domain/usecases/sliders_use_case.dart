import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/home/domain/entities/sliders_response.dart';
import 'package:drug_flow/features/home/domain/repositories/home_repositories.dart';

class SlidersUseCase extends UseCase<SlidersResponse,NoParams>{
  final HomeRepositories homeRepositories;


  SlidersUseCase(this.homeRepositories);

  @override
  Future<Either<Failure, SlidersResponse>> call(NoParams params)async {
    return await homeRepositories.getSliders();
  }
}