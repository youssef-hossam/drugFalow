part of 'coupons_cubit.dart';

@immutable
sealed class CouponsState {}

final class CouponsInitial extends CouponsState {}


class CouponsLoading extends CouponsState {}



class CouponsError extends CouponsState {}




class CouponsSuccess extends CouponsState {}
