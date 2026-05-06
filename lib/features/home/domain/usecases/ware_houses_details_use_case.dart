import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_details_response.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_params.dart';
import 'package:drug_flow/features/home/domain/repositories/home_repositories.dart';

class WareHousesDetailsUseCase extends UseCase<WareHouseDetailsResponse,WareHouseParams>{
  final HomeRepositories homeRepositories;


  WareHousesDetailsUseCase(this.homeRepositories);

  @override
  Future<Either<Failure, WareHouseDetailsResponse>> call(WareHouseParams params)async {
    return await homeRepositories.getWhareHouseDetails(params: params);
  }
}