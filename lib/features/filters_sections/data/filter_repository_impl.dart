import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/filters_sections/data/filter_remote_data_source_impl.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/active_ingredients.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/categories_list_response.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/medicine_response.dart';
import 'package:drug_flow/features/filters_sections/domain/repositories/filter_sections_repository.dart';

import '../../../core/errors/exceptions.dart';

class FilterRepositoryImpl implements FilterSectionsRepository{
  final FilterRemoteDataSource filterRemoteDataSource;


  FilterRepositoryImpl(this.filterRemoteDataSource);

  @override
  Future<Either<Failure, ActiveIngredientsResponse>> getActiveIngredients() async{
    try{
      final response = await filterRemoteDataSource.getActiveIngredients();
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
  Future<Either<Failure, CategoriesListResponse>> getCategoriesList() async{
    try{
      final response = await filterRemoteDataSource.getCategoriesList();
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
  Future<Either<Failure, MedicineResponse>> getMedicine() async{
    try{
      final response = await filterRemoteDataSource.getMedicine();
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