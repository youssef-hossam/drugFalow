import 'package:drug_flow/features/filters_sections/data/filter_remote_data_source_impl.dart';
import 'package:drug_flow/features/filters_sections/data/filter_repository_impl.dart';
import 'package:drug_flow/features/filters_sections/domain/repositories/filter_sections_repository.dart';
import 'package:drug_flow/features/filters_sections/domain/usecases/active_ingredients_use_case.dart';
import 'package:drug_flow/features/filters_sections/domain/usecases/categories_list_use_case.dart';
import 'package:drug_flow/features/filters_sections/domain/usecases/medicine_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void>initFilterInj(GetIt s)async{
  s.registerLazySingleton<FilterSectionsRepository>(()=>FilterRepositoryImpl(s()));
  s.registerLazySingleton<FilterRemoteDataSource>(()=>FilterRemoteDataSourceImpl(s()));
  
  s.registerLazySingleton(()=>ActiveIngredientsUseCase(s()));
  s.registerLazySingleton(()=>CategoriesListUseCase(s()));
  s.registerLazySingleton(()=>MedicineUseCase(s()));
}