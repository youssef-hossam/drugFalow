part of 'update_cart_item_cubit.dart';

@immutable
sealed class UpdateCartItemState {}

final class UpdateCartItemInitial extends UpdateCartItemState {}



class UpdateCartItemLoading extends UpdateCartItemState {}



class UpdateCartItemError extends UpdateCartItemState {
  final String message;

  UpdateCartItemError({required this.message});
}



class UpdateCartItemSuccess extends UpdateCartItemState  {

}

