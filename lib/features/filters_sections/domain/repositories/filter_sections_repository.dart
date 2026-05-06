import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/medicine_response.dart';
import 'package:dartz/dartz.dart';

import '../entities/active_ingredients.dart';
import '../entities/categories_list_response.dart';

abstract class FilterSectionsRepository {
  Future<Either<Failure,MedicineResponse>>getMedicine();
  Future<Either<Failure,ActiveIngredientsResponse>>getActiveIngredients();
  Future<Either<Failure,CategoriesListResponse>>getCategoriesList();
}