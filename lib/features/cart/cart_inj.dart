import 'package:drug_flow/features/auth/domain/usecases/delete_account_use_case.dart';
import 'package:drug_flow/features/cart/data/cart_remote_data_source_impl.dart';
import 'package:drug_flow/features/cart/data/cart_reposiotry_impl.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';
import 'package:drug_flow/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:drug_flow/features/cart/domain/usecases/cart_item_counts_use_case.dart';
import 'package:drug_flow/features/cart/domain/usecases/cart_items_use_case.dart';
import 'package:drug_flow/features/cart/domain/usecases/update_cart_item_use_case.dart';
import 'package:drug_flow/features/cart/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'package:drug_flow/features/cart/presentation/cubit/cart_item_counts/cart_item_counts_cubit.dart';
import 'package:drug_flow/features/cart/presentation/cubit/cart_items/cart_items_cubit.dart';
import 'package:drug_flow/features/cart/presentation/cubit/delete_cart_item/delete_cart_item_cubit.dart';
import 'package:drug_flow/features/cart/presentation/cubit/update_cart_item/update_cart_item_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void>initCartInj(GetIt s)async{
  s.registerFactory(()=>CartItemsCubit(s()));
  s.registerFactory(()=>CartItemCountsCubit(s()));
  s.registerFactory(()=>AddToCartCubit(s()));
  s.registerFactory(()=>DeleteCartItemCubit(s()));
  s.registerFactory(()=>UpdateCartItemCubit(s()));
  s.registerLazySingleton<CartRemoteDataSource>(()=>CartRemoteDataSourceImpl(s()));
  s.registerLazySingleton<CartRepositories>(()=>CartRepositoryImpl(s()));
  s.registerLazySingleton(()=>AddToCartUseCase(s()));
  s.registerLazySingleton(()=>CartItemsUseCase(s()));
  s.registerLazySingleton(()=>CartItemCountsUseCase(s()));
  s.registerLazySingleton(()=>UpdateCartItemUseCase(s()));
}