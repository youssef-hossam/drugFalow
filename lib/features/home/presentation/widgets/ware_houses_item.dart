import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WareHousesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 9.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color111111.withOpacity(.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.4.w, vertical: 5.4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color111111.withOpacity(.1)),
            ),
            child: ImageHandler(img: ware1, width: 75.w, height: 75.w),
          ),
          SizedBox(height: 11.6.h),
          Text(
            "الريان فارم",
            style: TextStyles.textStyleNormal13.copyWith(
              color: color6C6C89,
              fontWeight: FontWeight.w500,
            ),
            textScaler: TextScaler.linear(1),
          ),
        ],
      ),
    );
  }
}
