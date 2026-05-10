import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WareHouseItemHorizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color111111.withOpacity(.1),
              ),
            ),
            child: ClipOval(
              child: ImageHandler(img: ware1,
                  width: 62.5.w, height: 62.5.w),
            ),
          ),
          SizedBox(height: 13.5.h,),
          Text("الريان فارم",style: TextStyles.textStyleNormal13.copyWith(
              color: color6C6C89,
              fontWeight: FontWeight.w500
          ),textScaler: TextScaler.linear(1),)
        ],
      ),
    );
  }
}