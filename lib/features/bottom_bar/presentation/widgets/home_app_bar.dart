import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar homeAppBar({BuildContext? context}) {
  return AppBar(
    backgroundColor: white,
    surfaceTintColor: white,
    elevation: 0,
    foregroundColor: white,
    leading: InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        child: customSvg(
          name: notification,
          width: 28.w,
          height: 28.h,
          fit: BoxFit.cover,
        ),
      ),
    ),
    actions: [
      SizedBox(width: 12.5.w),
      Container(
        width: 53.6.w,
        height: 53.6.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, color: primaryDark),
        child: ImageHandler(img: profile, width: 41.7.w, height: 41.7.w),
      ),
      SizedBox(width: 5.4.w),
      Text(
        "درج فلو",
        style: TextStyles.textStyleBold20.copyWith(color: primaryDark),
        textScaler: TextScaler.linear(1),
      ),
      SizedBox(width: 12.5.w),
    ],
  );
}
