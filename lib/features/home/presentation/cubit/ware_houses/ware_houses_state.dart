part of 'ware_houses_cubit.dart';

@immutable
sealed class WareHousesState {}

final class WareHousesInitial extends WareHousesState {}


class WareHousesLoading extends WareHousesState{}



class WareHousesError extends WareHousesState{
  final String message;

  WareHousesError({required this.message});
}



class WareHousesSuccess extends WareHousesState {}


