import 'package:drug_flow/features/profile/data/profile_remote_data_source_impl.dart';
import 'package:drug_flow/features/profile/data/profile_repository_impl.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';
import 'package:drug_flow/features/profile/domain/uesecases/contact_us_use_case.dart';
import 'package:drug_flow/features/profile/domain/uesecases/coupons_use_case.dart';
import 'package:drug_flow/features/profile/domain/uesecases/fqa_use_case.dart';
import 'package:drug_flow/features/profile/domain/uesecases/social_links_use_case.dart';
import 'package:drug_flow/features/profile/presentation/cubit/contact_us/contact_us_cubit.dart';
import 'package:drug_flow/features/profile/presentation/cubit/coupons/coupons_cubit.dart';
import 'package:drug_flow/features/profile/presentation/cubit/faqs/faqs_cubit.dart';
import 'package:drug_flow/features/profile/presentation/cubit/social_links/social_links_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void>initProfileInj(GetIt s)async{
  s.registerFactory(()=>ContactUsCubit(s()));
  s.registerFactory(()=>CouponsCubit(s()));
  s.registerFactory(()=>FaqsCubit(s()));
  s.registerFactory(()=>SocialLinksCubit(s()));
  
  s.registerLazySingleton<ProfileRemoteDataSource>(()=>ProfileRemoteDataSourceImpl(s()));
  s.registerLazySingleton<ProfileRepositories>(()=>ProfileRepositoryImpl(s()));
  
  s.registerLazySingleton(()=>ContactUsUseCase(s()));
  s.registerLazySingleton(()=>FqaUseCase(s()));
  s.registerLazySingleton(()=>SocialLinksUseCase(s()));
  s.registerLazySingleton(()=>CouponsUseCase(s()));
}