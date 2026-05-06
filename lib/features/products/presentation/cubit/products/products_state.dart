part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}


class ProductsLoading extends ProductsState {}



class ProductsError extends ProductsState {

}



class ProductsSuccess extends ProductsState {}


class UpdateTabState extends ProductsState {}