import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController controller = PageController(initialPage: 0);

  int pageInd = 0;

  void onPageIndex({required int ind}) {
    pageInd = ind;
    emit(OnBoardingUpdatePage());
  }

  Future<void> nextPage() async {
    await controller.animateToPage(
      pageInd + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutExpo,
    );

    emit(UpdateAnimatedPage());
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
