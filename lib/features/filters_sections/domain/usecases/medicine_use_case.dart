import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/medicine_response.dart';
import 'package:drug_flow/features/filters_sections/domain/repositories/filter_sections_repository.dart';

class MedicineUseCase extends UseCase<MedicineResponse,NoParams>{
  final FilterSectionsRepository filterSectionsRepository;

  MedicineUseCase(this.filterSectionsRepository);

  @override
  Future<Either<Failure, MedicineResponse>> call(NoParams params) async{
    return await filterSectionsRepository.getMedicine();
  }
}