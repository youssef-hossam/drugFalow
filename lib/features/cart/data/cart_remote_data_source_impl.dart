import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon.dart';
import 'package:drug_flow/features/cart/domain/entities/apply_coupon/apply_coupon_params.dart';
import 'package:drug_flow/features/cart/domain/entities/cart_items/my_cart_items.dart';
import 'package:drug_flow/features/cart/domain/entities/delete_cart_item/delete_cart_item_params.dart';
import 'package:drug_flow/features/cart/domain/entities/update_cart_item/update_cart_item_params.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/utils/api_base_helper.dart';
import '../domain/entities/add_to_cart/add_to_cart.dart';
import '../domain/entities/add_to_cart/cart_params.dart';
import 'package:dio/dio.dart';

import '../domain/entities/cart_items_count/cart_items_count.dart';
import '../domain/entities/delete_cart_item/delete_cart_items.dart';
import '../domain/entities/update_cart_item/update_cart_items.dart';

const addToCartApi = "/orders/add-to-cart";
const cartItemCountsApi = "/orders/cart-items-count";
const ordersMyCartItems = "/orders/my-carts";
const updateCartItemApi = "/orders/cart-items/";
const applyCouponApi = "/orders/validate-coupon";

abstract class CartRemoteDataSource {
  Future<AddToCart>addToCart({CartParams? params});
  Future<ApplyCouponResponse>applyCoupon({ApplyCouponParams? params});
  Future<MyCartItems>getCartItems();
  Future<UpdateCartItem>updateCartItem({UpdateCartItemParams? params});
  Future<DeleteCartItemResponse>deleteCartItem({DeleteCartItemParams? params});
  Future<CartItemsCount>getCartItemCounts();



}

class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  final ApiBaseHelper helper;


  CartRemoteDataSourceImpl(this.helper);

  @override
  Future<AddToCart> addToCart({CartParams? params})async {
    try {
      final formData = FormData.fromMap({
        ...params!.toMap(),
      });
      final response = await helper.post(url: addToCartApi, formData: formData);
      return AddToCart.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<DeleteCartItemResponse> deleteCartItem({DeleteCartItemParams? params})async {
    try {

      final response = await helper.delete(url: "$updateCartItemApi/${params!.cartItemId}",);
      return DeleteCartItemResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<MyCartItems> getCartItems() async{
    try {
      final response = await helper.get(url: ordersMyCartItems,);
      return MyCartItems.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<UpdateCartItem> updateCartItem({UpdateCartItemParams? params}) async{
    try {
      final formData = FormData.fromMap({
        "quantity" : params!.quantity
      });
      final response = await helper.post(url: "$updateCartItemApi/${params.cartItemId}"
          ,formData: formData);
      return UpdateCartItem.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }


  @override
  Future<CartItemsCount> getCartItemCounts() async{
    try {
      final response = await helper.get(url: cartItemCountsApi);
      return CartItemsCount.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }

  @override
  Future<ApplyCouponResponse> applyCoupon({ApplyCouponParams? params})async {
    try {
      final formData = FormData.fromMap({
        ...params!.toMap(),
      });
      final response = await helper.post(url: applyCouponApi,formData: formData);
      return ApplyCouponResponse.fromJson(response);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    } on UnAuthorizedException catch (e) {
      throw UnAuthorizedException(message: e.message);
    } on UnprocessableContentException catch (e) {
      throw UnprocessableContentException(message: e.message);
    }
  }


}