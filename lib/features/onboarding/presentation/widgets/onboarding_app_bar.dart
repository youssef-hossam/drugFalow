import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:flutter/material.dart';

class OnboardingAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width/30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.width/40,
            vertical: context.height/85),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colorD1d1dB,width: 1.0)
            ),
            child: Text("العربية",style: TextStyles.textStyleNormal13.copyWith(
              color: color121217
            ),textScaler: TextScaler.linear(1),),
          ),
          TextButton(
              style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size(50, 30),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      alignment: Alignment.center),
              onPressed: (){}, child: Text("تخطي",
            style: TextStyles.textStyleNormal13.copyWith(
            color: color121217,
          ),textScaler:TextScaler.linear(1),))

        ],
      ),
    );
  }
}