import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_response.dart';
import 'package:drug_flow/features/home/domain/repositories/home_repositories.dart';

class WareHousesUseCase extends UseCase<WareHouseResponse,NoParams>{
  final HomeRepositories homeRepositories;

  WareHousesUseCase(this.homeRepositories);

  @override
  Future<Either<Failure, WareHouseResponse>> call(NoParams params)async {
    return await homeRepositories.getWhareHouse();
  }
}