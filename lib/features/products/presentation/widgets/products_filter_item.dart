import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsFilterItem extends StatelessWidget{
  final String title;


  ProductsFilterItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 54.1.h,
      padding: EdgeInsets.symmetric(horizontal: 18.8.w,
          vertical: 16.2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.0,
          color: color121217.withOpacity(.1),
        )
      ),
      child: Text(title,style: TextStyles.textStyleNormal14.copyWith(
        color: color121217
      ),textScaler: TextScaler.linear(1),),
    );
  }
}