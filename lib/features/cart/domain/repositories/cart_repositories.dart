import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon.dart';

import '../../../../core/errors/failure.dart';
import '../entities/add_to_cart/add_to_cart.dart';
import '../entities/add_to_cart/cart_params.dart';
import 'package:dartz/dartz.dart';

import '../entities/apply_coupon/apply_coupon_params.dart';
import '../entities/cart_items/my_cart_items.dart';
import '../entities/cart_items_count/cart_items_count.dart';
import '../entities/delete_cart_item/delete_cart_item_params.dart';
import '../entities/delete_cart_item/delete_cart_items.dart';
import '../entities/update_cart_item/update_cart_item_params.dart';
import '../entities/update_cart_item/update_cart_items.dart';

abstract class CartRepositories {
  Future<Either<Failure,AddToCart>>addToCart({CartParams? params});
  Future<Either<Failure,MyCartItems>>getCartItems();
  Future<Either<Failure,UpdateCartItem>>updateCartItem({UpdateCartItemParams? params});
  Future<Either<Failure,DeleteCartItemResponse>>deleteCartItem({DeleteCartItemParams? params});
  Future<Either<Failure,CartItemsCount>>getCartItemCounts();
  Future<Either<Failure,ApplyCouponResponse>>applyCoupon({ApplyCouponParams? params});



}