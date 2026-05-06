part of 'delete_cart_item_cubit.dart';

@immutable
sealed class DeleteCartItemState {}

final class DeleteCartItemInitial extends DeleteCartItemState {}


class DeleteCartItemLoading extends DeleteCartItemState  {}



class DeleteCartItemError extends DeleteCartItemState {
  final String message;

  DeleteCartItemError({required this.message});
}



class DeleteCartItemSuccess extends DeleteCartItemState {

}

