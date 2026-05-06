import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/active_ingredients.dart';
import 'package:drug_flow/features/filters_sections/domain/repositories/filter_sections_repository.dart';

class ActiveIngredientsUseCase extends UseCase<ActiveIngredientsResponse,NoParams>{
  final FilterSectionsRepository filterSectionsRepository;


  ActiveIngredientsUseCase(this.filterSectionsRepository);

  @override
  Future<Either<Failure, ActiveIngredientsResponse>> call(NoParams params)async {
    return await filterSectionsRepository.getActiveIngredients();
  }
}