part of 'apply_coupon_cubit.dart';

@immutable
sealed class ApplyCouponState {}

final class ApplyCouponInitial extends ApplyCouponState {}


class ApplyCouponLoading extends ApplyCouponState  {}



class ApplyCouponError extends ApplyCouponState  {
  final String message;

  ApplyCouponError({required this.message});
}



class ApplyCouponSuccess extends ApplyCouponState  {

}

