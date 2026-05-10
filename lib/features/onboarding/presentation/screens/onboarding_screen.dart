import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> images = [onboarding, onboarding2, onboarding3];
  List<OnboardingData> get onBoardingList => [
    OnboardingData(
      title: tr("onboarding_title_1"),
      description: tr("onboarding_desc_1"),
    ),
    OnboardingData(
      title: tr("onboarding_title_2"),
      description: tr("onboarding_desc_2"),
    ),
    OnboardingData(
      title: tr("onboarding_title_3"),
      description: tr("onboarding_desc_3"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top: 27.h),
        child: Column(
          children: [
            SizedBox(height: 20.3.h),
            OnboardingAppBar(),
            SizedBox(height: 13.5.h),
            Expanded(
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return PageView(
                    controller: context.read<OnboardingCubit>().controller,
                    padEnds: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,

                    onPageChanged: (pageInd) {
                      context.read<OnboardingCubit>().onPageIndex(ind: pageInd);
                    },

                    allowImplicitScrolling: true,

                    children: images.map((i) {
                      return OnBoardingFirst(img: i);
                    }).toList(),
                  );
                },
              ),
            ),

            SizedBox(height: 10.h),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return OnboardingDescriptionWidget(
                  title: onBoardingList[context.read<OnboardingCubit>().pageInd]
                      .title,
                  description:
                      onBoardingList[context.read<OnboardingCubit>().pageInd]
                          .description,
                );
              },
            ),
            SizedBox(height: 10.h),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return SmoothPageIndicator(
                  textDirection: Directionality.of(context),
                  effect: ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 20.0,
                    dotWidth: 6.2.w,
                    dotHeight: 6.2.w,
                    activeDotColor: color97C3D0,

                    dotColor: colorCCE5EC,
                  ),
                  controller: context.read<OnboardingCubit>().controller,
                  count: 3,
                );
              },
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return AnimatedOpacity(
                  opacity: context.read<OnboardingCubit>().pageInd == 2 ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),

                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: CustomButton(
                          color: Colors.transparent,
                          btnTitle: tr("register"),
                          style: TextStyles.textStyleNormal14,
                          borderSide: BorderSide(color: colorD1d1dB, width: 1),
                          onPressed: () async {
                            context.push(registerSc);
                          },

                          type: '',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  final cubit = context.read<OnboardingCubit>();
                  final isLastPage = cubit.pageInd == 2;

                  return CustomButton(
                    btnTitle: isLastPage ? tr("login") : tr("next"),
                    isNextButton: !isLastPage,
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
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
