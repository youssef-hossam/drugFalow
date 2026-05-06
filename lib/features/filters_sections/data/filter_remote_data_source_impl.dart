import 'package:drug_flow/core/utils/api_base_helper.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/active_ingredients.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/categories_list_response.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/medicine_response.dart';

import '../../../core/errors/exceptions.dart';

const medicinesApi = "/medicines";
const activeIngredientsApi = "/active-ingredients";
const categoriesListApi = "/categories-list";

abstract class FilterRemoteDataSource {

  Future<MedicineResponse>getMedicine();
  Future<ActiveIngredientsResponse>getActiveIngredients();
  Future<CategoriesListResponse>getCategoriesList();
}

class FilterRemoteDataSourceImpl implements FilterRemoteDataSource{
  final ApiBaseHelper helper;


  FilterRemoteDataSourceImpl(this.helper);

  @override
  Future<ActiveIngredientsResponse> getActiveIngredients() async{
    try {
      final response = await helper.get(url: activeIngredientsApi,);
      return ActiveIngredientsResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<CategoriesListResponse> getCategoriesList() async{
    try {
      final response = await helper.get(url: categoriesListApi,);
      return CategoriesListResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<MedicineResponse> getMedicine() async{
    try {
      final response = await helper.get(url: medicinesApi,);
      return MedicineResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }
}