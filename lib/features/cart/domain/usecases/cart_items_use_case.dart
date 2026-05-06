import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/cart_items/my_cart_items.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class CartItemsUseCase extends UseCase<MyCartItems,NoParams>{
  final CartRepositories cartRepositories;


  CartItemsUseCase(this.cartRepositories);

  @override
  Future<Either<Failure,MyCartItems>> call(NoParams params) async{
    return cartRepositories.getCartItems();
  }
}