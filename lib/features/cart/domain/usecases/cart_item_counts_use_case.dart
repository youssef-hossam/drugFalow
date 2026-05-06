import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/cart_items_count/cart_items_count.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class CartItemCountsUseCase extends UseCase<CartItemsCount,NoParams>{
  final CartRepositories cartRepositories;


  CartItemCountsUseCase(this.cartRepositories);

  @override
  Future<Either<Failure, CartItemsCount>> call(NoParams params) async{
    return await cartRepositories.getCartItemCounts();
  }

}