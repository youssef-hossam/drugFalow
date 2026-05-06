import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/products/domain/entities/products/products_response.dart';
import 'package:dartz/dartz.dart';
import '../entities/product_details/product_details_params.dart';
import '../entities/product_details/product_details_response.dart';
import '../entities/products/products_params.dart';

abstract class ProductsRepositories {
  Future<Either<Failure,ProductsResponse>>getProducts({ProductsParams? params});
  Future<Either<Failure,ProductDetailsResponse>>getProductDetails({ProductDetailsParams? params});
}