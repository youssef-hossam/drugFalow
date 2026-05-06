import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/home/data/home_remote_data_source_impl.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/home/domain/entities/sliders_response.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_details_response.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_params.dart';
import 'package:drug_flow/features/home/domain/entities/ware_house/ware_house_response.dart';
import 'package:drug_flow/features/home/domain/repositories/home_repositories.dart';

import '../../../core/errors/exceptions.dart';

class HomeRepositoryImpl implements HomeRepositories{
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, SlidersResponse>> getSliders() async{
    try{
      final response = await homeRemoteDataSource.getSliders();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CouponsResponse>> getCoupons() async{
    try{
      final response = await homeRemoteDataSource.getCoupons();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, WareHouseResponse>> getWhareHouse()async {
    try{
      final response = await homeRemoteDataSource.getWhareHouse();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, WareHouseDetailsResponse>>
  getWhareHouseDetails({WareHouseParams? params})async {
    try{
      final response = await homeRemoteDataSource.getWhareHouseDetails(params: params!);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }
}