import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/filters_sections/data/filter_remote_data_source_impl.dart';
import 'package:drug_flow/features/filters_sections/domain/entities/categories_list_response.dart';
import 'package:drug_flow/features/filters_sections/domain/repositories/filter_sections_repository.dart';

class CategoriesListUseCase extends UseCase<CategoriesListResponse,NoParams>{
  final FilterSectionsRepository filterSectionsRepository;

  CategoriesListUseCase(this.filterSectionsRepository);

  @override
  Future<Either<Failure, CategoriesListResponse>> call(NoParams params) async{
   return await filterSectionsRepository.getCategoriesList();
  }
}