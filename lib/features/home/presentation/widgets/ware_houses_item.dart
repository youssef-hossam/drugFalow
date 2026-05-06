import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:flutter/cupertino.dart';

class WareHousesItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: context.width/50,
      vertical: context.height/90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color111111.withOpacity(.1)
        )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.width/70,
                vertical: context.width/70),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: color111111.withOpacity(.1)
                )),
            child: ImageHandler(img: ware1, width: context.width/5,
                height: context.width/5),
          ),
          SizedBox(height: context.height/70,),
          Text("الريان فارم",style: TextStyles.textStyleNormal13.copyWith(
            color: color6C6C89,
            fontWeight: FontWeight.w500
          ),textScaler: TextScaler.linear(1),)
        ],
      ),
    );
  }
}