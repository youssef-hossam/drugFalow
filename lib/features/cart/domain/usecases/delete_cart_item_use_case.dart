import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_items.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class DeleteCartItemUseCase  extends UseCase<DeleteCartItemResponse,DeleteCartItemParams>{
final CartRepositories cartRepositories;


DeleteCartItemUseCase(this.cartRepositories);

@override
  Future<Either<Failure, DeleteCartItemResponse>> call(DeleteCartItemParams params) async{
   return await cartRepositories.deleteCartItem(params: params);
  }
}