part of 'cart_item_counts_cubit.dart';

@immutable
sealed class CartItemCountsState {}

final class CartItemCountsInitial extends CartItemCountsState {}


class CartItemCountsLoading extends CartItemCountsState  {}



class CartItemCountsError extends CartItemCountsState  {
  final String message;

  CartItemCountsError({required this.message});
}



class CartItemCountsSuccess extends CartItemCountsState  {

}
