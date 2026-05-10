import 'dart:math' as math;
import 'package:go_router/go_router.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
import '../constants/styles.dart';
import '../utils/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar({required BuildContext context}) {
  return AppBar(
    toolbarHeight: 64.h,
    backgroundColor: white,
    surfaceTintColor: white,

    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tr("change_language"),
                    style: TextStyles.textStyleNormal16,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text(tr("arabic")),
                    onTap: () {
                      context.setLocale(const Locale('ar'));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(tr("english")),
                    onTap: () {
                      context.setLocale(const Locale('en'));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.5.w),
          padding: EdgeInsets.symmetric(horizontal: 13.9.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorD1d1dB, width: 1.0),
          ),
          child: Text(
            context.locale.languageCode == 'ar' ? tr("arabic") : tr("english"),
            style: TextStyles.textStyleNormal13.copyWith(color: color121217),
            textScaler: TextScaler.linear(1),
          ),
        ),
      ),
    ],
    leading: InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        final router = GoRouter.of(context);

        if (router.canPop()) {
          router.pop();
        } else {
          router.go('/'); // or your fallback route (login/home)
        }
      },
      child: Container(
        alignment: Alignment.center,

        child: customSvg(
          name: back,
          fit: BoxFit.cover,
          width: 9.6.w,
          height: 20.8.h,
        ),
      ),
    ),
  );
}
