import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/cart/data/cart_remote_data_source_impl.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/add_to_cart.dart';
import 'package:drug_flow/features/cart/domain/entities/add_to_cart/cart_params.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon_params.dart';
import 'package:drug_flow/features/cart/domain/entities/cart_items/my_cart_items.dart';
import 'package:drug_flow/features/cart/domain/entities/cart_items_count/cart_items_count.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_items.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_items.dart';
import 'package:drug_flow/features/cart/domain/repositories/cart_repositories.dart';

import '../../../core/errors/exceptions.dart';

class CartRepositoryImpl implements CartRepositories{
  final CartRemoteDataSource cartRemoteDataSource;


  CartRepositoryImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, AddToCart>> addToCart({CartParams? params}) async{
    try{
      final response = await cartRemoteDataSource.addToCart(params: params);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, DeleteCartItemResponse>> deleteCartItem({DeleteCartItemParams? params}) async{
    try{
      final response = await cartRemoteDataSource.deleteCartItem(params: params);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CartItemsCount>> getCartItemCounts() async{
    try{
      final response = await cartRemoteDataSource.getCartItemCounts();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, MyCartItems>> getCartItems()async {
    try{
      final response = await cartRemoteDataSource.getCartItems();
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UpdateCartItem>> updateCartItem({UpdateCartItemParams? params})async {
    try{
      final response = await cartRemoteDataSource.updateCartItem(params: params);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApplyCouponResponse>> applyCoupon({ApplyCouponParams? params})async {
    try{
      final response = await cartRemoteDataSource.applyCoupon(params: params);
      return Right(response);
    }on ServerException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnAuthorizedException catch(e){
      return left(ServerFailure(message: e.message));
    }on UnprocessableContentException catch(e){
      return left(ServerFailure(message: e.message));
    }
  }
}
