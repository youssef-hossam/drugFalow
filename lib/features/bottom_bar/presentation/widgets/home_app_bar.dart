import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/styles.dart';

AppBar homeAppBar({BuildContext? context}){
  return AppBar(
    backgroundColor: white,
    surfaceTintColor: white,
    elevation: 0,
    foregroundColor: white,
    leading: InkWell(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        child: customSvg(name: notification,width: context!.width/29,
        height: context.height/29,fit: BoxFit.cover),
      ),
    ),
    actions: [
      SizedBox(width: context.width/30,),
      Container(
        width: context.width/7,
        height: context.width/7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryDark
        ),
        child:  ImageHandler(img: profile, width: context!.width/9,
              height: context.width/9),),
      SizedBox(width: context.width/70,),
      Text("درج فلو",
        style: TextStyles.textStyleBold20.copyWith(
            color: primaryDark
        ),textScaler: TextScaler.linear(1),),
      SizedBox(width: context.width/30,),
    ],
  );
}