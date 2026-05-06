part of 'ware_houses_details_cubit.dart';

@immutable
sealed class WareHousesDetailsState {}

final class WareHousesDetailsInitial extends WareHousesDetailsState {}




class WareHousesDetailsLoading extends WareHousesDetailsState {}



class WareHousesDetailsError extends WareHousesDetailsState {
  final String message;

  WareHousesDetailsError({required this.message});
}



class WareHousesDetailsSuccess extends WareHousesDetailsState {}
