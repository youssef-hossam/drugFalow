import 'package:drug_flow/features/products/data/products_remote_data_source_impl.dart';
import 'package:drug_flow/features/products/data/products_repository_impl.dart';
import 'package:drug_flow/features/products/domain/repositories/products_repositories.dart';
import 'package:drug_flow/features/products/domain/usecases/products_details_use_case.dart';
import 'package:drug_flow/features/products/domain/usecases/products_use_case.dart';
import 'package:drug_flow/features/products/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:drug_flow/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void>initProductsInj(GetIt s)async{
  s.registerFactory(()=>ProductsCubit(s()));
  s.registerFactory(()=>ProductDetailsCubit(s()));

  s.registerLazySingleton<ProductsRepositories>(()=>ProductsRepositoryImpl(s()));
  s.registerLazySingleton<ProductsRemoteDataSource>(()=>ProductsRemoteDataSourceImpl(s()));


  s.registerLazySingleton(()=>ProductsUseCase(s()));
  s.registerLazySingleton(()=>ProductsDetailsUseCase(s()));
}