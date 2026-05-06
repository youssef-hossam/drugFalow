import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_items.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class UpdateCartItemUseCase extends UseCase<UpdateCartItem,UpdateCartItemParams>{
  final CartRepositories cartRepositories;


  UpdateCartItemUseCase(this.cartRepositories);

  @override
  Future<Either<Failure, UpdateCartItem>> call(UpdateCartItemParams params)async {
   return await cartRepositories.updateCartItem(params: params);
  }
}