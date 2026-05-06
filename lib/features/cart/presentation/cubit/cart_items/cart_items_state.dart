part of 'cart_items_cubit.dart';

@immutable
sealed class CartItemsState {}

final class CartItemsInitial extends CartItemsState {}


class CartItemsLoading extends CartItemsState  {}



class CartItemsError extends CartItemsState {
  final String message;

  CartItemsError({required this.message});
}



class CartItemsSuccess extends CartItemsState  {

}
class UpdateCartState extends CartItemsState {}

