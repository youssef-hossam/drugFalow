import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/products/domain/entities/products/products_params.dart';
import 'package:drug_flow/features/products/domain/entities/products/products_response.dart';
import 'package:drug_flow/features/products/domain/repositories/products_repositories.dart';

class ProductsUseCase extends UseCase<ProductsResponse,ProductsParams>{
  final ProductsRepositories productsRepositories;


  ProductsUseCase(this.productsRepositories);

  @override
  Future<Either<Failure, ProductsResponse>> call(ProductsParams params)async {
    return await productsRepositories.getProducts(params: params);
  }
}