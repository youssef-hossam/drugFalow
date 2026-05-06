import 'package:dartz/dartz.dart';
import 'package:drug_flow/core/errors/failure.dart';
import 'package:drug_flow/core/usecases/usecase.dart';
import 'package:drug_flow/features/profile/domain/entities/social_links_response.dart';
import 'package:drug_flow/features/profile/domain/repositories/profile_repositories.dart';

class SocialLinksUseCase extends UseCase<SocialLinksResponse,NoParams>{
  final ProfileRepositories profileRepositories;

  SocialLinksUseCase(this.profileRepositories);

  @override
  Future<Either<Failure, SocialLinksResponse>> call(NoParams params)async {
    return await profileRepositories.getSocialLinks();
  }
}