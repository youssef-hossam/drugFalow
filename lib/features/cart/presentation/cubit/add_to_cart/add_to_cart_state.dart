part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}


class AddToCartLoading extends AddToCartState {}



class AddToCartError extends AddToCartState {
  final String message;

  AddToCartError({required this.message});
}



class AddToCartSuccess extends AddToCartState {

}

