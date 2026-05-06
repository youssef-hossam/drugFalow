import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/add_to_cart.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/cart_params.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

class AddToCartUseCase extends UseCase<AddToCart,CartParams>{
  final CartRepositories cartRepositories;


  AddToCartUseCase(this.cartRepositories);

  @override
  Future<Either<Failure, AddToCart>> call(CartParams params) async{
    return await cartRepositories.addToCart(params: params);
  }
}