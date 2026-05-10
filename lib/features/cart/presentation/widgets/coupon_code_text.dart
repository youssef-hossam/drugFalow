import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/svg_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponCodeText extends StatefulWidget{
  final TextEditingController couponCodeController;


  CouponCodeText({required this.couponCodeController});

  @override
  State<CouponCodeText > createState() => _CouponCodeText();
}

class _CouponCodeText extends State<CouponCodeText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: MediaQuery(

        data: MediaQueryData(textScaler: TextScaler.linear(1)),
        child: TextField(
          controller: widget.couponCodeController,
          onChanged: (val){},
          style: TextStyles.textStyleNormal15.copyWith(
            color: color121217,
          ),
          decoration: InputDecoration(
            hintText: "ادخل كود الخصم",
            hintStyle: TextStyles.textStyleNormal15.copyWith(
              color: color6C6C89,
            ),



// ❌ clear icon (only behavior added)
            suffixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.5.w),
              margin: EdgeInsets.symmetric(horizontal: 12.5.w),
              width: 62.5.w,
              decoration: BoxDecoration(
                  color: colorCCE5EC,
                  borderRadius: BorderRadius.circular(12)
              ),
              alignment: Alignment.center,
              child: Text("تطبيق",style: TextStyles.textStyleNormal14.copyWith(
                  color: white
              ),textScaler: TextScaler.linear(1),),
            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(color: color121217.withOpacity(.05)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

