import 'dart:ui' as ui;
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/features/onboarding/presentation/widgets/onboarding_app_bar.dart';
import 'package:drug_flow/features/onboarding/presentation/widgets/onboarding_description_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:drug_flow/features/onboarding/presentation/widgets/on_boarding_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/screens.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entities/onboarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> images = [onboarding, onboarding2, onboarding3];
  List<OnboardingData> onBoardingList = [
    OnboardingData(
      title: "كل مخازن الأدوية في مكان واحد",
      description:
          "تصفح مئات المنتجات من أكثر من مخزن، وقارن الأسعار واختر الأنسب لصيدليتك بضغطة واحدة",
    ),
    OnboardingData(
      title: "طلب واحد، موردين متعددين",
      description:
          "أضف منتجات من مخازن مختلفة في سلة واحدة، ووفّر وقتك وجهدك في إدارة المشتريات اليومية",
    ),
    OnboardingData(
      title: "خصومات حصرية ومتابعة لحظية",
      description:
          "استفد من كوبونات الخصم المتاحة، وتابع حالة طلباتك من لحظة التأكيد حتى التسليم.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Column(
          children: [
            SizedBox(height: context.height / 40),
            OnboardingAppBar(),
            SizedBox(height: context.height / 60),
            Expanded(
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return SafeArea(
                    top: true,
                    bottom: false,
                    child: PageView(
                      controller: context.read<OnboardingCubit>().controller,
                      padEnds: false,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,

                      onPageChanged: (pageInd) {
                        context.read<OnboardingCubit>().onPageIndex(
                          ind: pageInd,
                        );
                      },

                      allowImplicitScrolling: true,

                      children: images.map((i) {
                        return OnBoardingFirst(img: i);
                      }).toList(),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: context.height / 30),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return OnboardingDescriptionWidget(
                  title:
                      onBoardingList[context.read<OnboardingCubit>().pageInd!]
                          .title,
                  description:
                      onBoardingList[context.read<OnboardingCubit>().pageInd!]
                          .description,
                );
              },
            ),
            SizedBox(height: context.height / 60),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return SmoothPageIndicator(
                  textDirection: ui.TextDirection.ltr,
                  effect: ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 20.0,
                    dotWidth: context.width / 60,
                    dotHeight: context.width / 60,
                    activeDotColor: color97C3D0,

                    dotColor: colorCCE5EC,
                  ),
                  controller: context.read<OnboardingCubit>().controller,
                  count: 3,
                );
              },
            ),
            SizedBox(height: context.height / 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: context.width / 23.4375,
                right: context.width / 23.4375,
              ),
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  final cubit = context.read<OnboardingCubit>();
                  final isLastPage = cubit.pageInd == 2;

                  return CustomButton(
                    btnTitle: isLastPage ? tr("login") : tr("next"),

                    onPressed: () async {
                      if (isLastPage) {
                        context.push(loginSc);
                      } else {
                        await cubit.nextPage();
                      }
                    },

                    type: '',
                  );
                },
              ),
            ),

            SizedBox(height: context.height / 30),
          ],
        ),
      ),
    );
  }
}
