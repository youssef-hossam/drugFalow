import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/features/home/domain/entities/coupons_response.dart';
import 'package:drug_flow/features/home/domain/entities/sliders_response.dart';
import "package:dartz/dartz.dart";

import '../entities/ware_house/ware_house_details_response.dart';
import '../entities/ware_house/ware_house_params.dart';
import '../entities/ware_house/ware_house_response.dart';

abstract class HomeRepositories {
  Future<Either<Failure,SlidersResponse>>getSliders();
  Future<Either<Failure,CouponsResponse>>getCoupons();
  Future<Either<Failure,WareHouseResponse>>getWhareHouse();
  Future<Either<Failure,WareHouseDetailsResponse>>getWhareHouseDetails({WareHouseParams params});
}