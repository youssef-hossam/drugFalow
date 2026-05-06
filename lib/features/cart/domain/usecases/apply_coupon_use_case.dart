import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon_params.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class ApplyCouponUseCase extends UseCase<ApplyCouponResponse,ApplyCouponParams>{
  final CartRepositories cartRepositories;


  ApplyCouponUseCase(this.cartRepositories);

  @override
  Future<Either<Failure, ApplyCouponResponse>> call(ApplyCouponParams params)async {
   return await cartRepositories.applyCoupon(params: params);
  }
}