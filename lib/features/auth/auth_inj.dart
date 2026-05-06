import 'package:drug_flow/core/local/auth_local_data_source.dart';
import 'package:drug_flow/features/auth/data/auth_remote_data_source_impl.dart';
import 'package:drug_flow/features/auth/data/auth_repository_impl.dart';
import 'package:drug_flow/features/auth/domain/repositories/auth_repositories.dart';
import 'package:drug_flow/features/auth/domain/usecases/delete_account_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/login_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/logout_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/register_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/resend_code_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/verify_account_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:drug_flow/features/auth/domain/usecases/verify_send_code_use_case.dart';
import 'package:drug_flow/features/auth/presentation/cubit/delete_account/delete_account_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/resend_code/resend_code_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/reset_password/reset_password_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/verify_account/verify_account_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/verify_reset_code/verify_reset_code_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/verify_send_code/verify_send_code_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void>initAuthInj(GetIt s)async{
  s.registerFactory(()=>LoginCubit(s()));
  s.registerFactory(()=>ForgotPasswordCubit(s()));
  s.registerFactory(()=>RegisterCubit(s()));
  s.registerFactory(()=>ResendCodeCubit(s()));
  s.registerFactory(()=>VerifyAccountCubit(s()));
  s.registerFactory(()=>VerifyResetCodeCubit(s()));
  s.registerFactory(()=>VerifySendCodeCubit(s()));
  s.registerFactory(()=>ResetPasswordCubit(s()));
  s.registerFactory(()=>LogoutCubit(s()));
  s.registerFactory(()=>DeleteAccountCubit(s()));
  
  s.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(helper: s()));
  s.registerLazySingleton<AuthLocalDataSource>(()=>AuthLocalDataSourceImpl(s()));
  s.registerLazySingleton<AuthRepositories>(()=>AuthRepositoryImpl(s(),s()));

  s.registerLazySingleton(()=>LoginUseCase(s()));
  s.registerLazySingleton(()=>RegisterUseCase(s()));
  s.registerLazySingleton(()=>ForgotPasswordUseCase(s()));
  s.registerLazySingleton(()=>ResendCodeUseCase(s()));
  s.registerLazySingleton(()=>VerifyAccountUseCase(s()));
  s.registerLazySingleton(()=>VerifySendCodeUseCase(s()));
  s.registerLazySingleton(()=>DeleteAccountUseCase(s()));
  s.registerLazySingleton(()=>LogOutUseCase(s()));
  s.registerLazySingleton(()=>VerifyResetCodeUseCase(s()));
  s.registerLazySingleton(()=>ResetPasswordUseCase(s()));
}