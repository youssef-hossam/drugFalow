import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/features/products/presentation/widgets/partition_name_item.dart';
import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width/30,
      vertical: context.height/50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ImageHandler(img: panadol, width: context.width/3.5
                , height: context.height/5),
          ),
          SizedBox(width: context.width/30,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("بانادول اكسترا اوبتيزورب لتخفيف إضافي مسكن فعال للألم والحمي | 24 قرص",
                style: TextStyles.textStyleNormal13.copyWith(
                  color: color121217
                ),textScaler: TextScaler.linear(1),),
                SizedBox(height: context.height/50,),
                Text("اسم القسم",style: TextStyles.textStyleNormal11.copyWith(
                  color: color6C6C89
                ),textScaler: TextScaler.linear(1),),
                SizedBox(height: context.height/90,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PartitionNameItem(title: "Paracetamol"),
                    SizedBox(width: context.width/30,),
                    PartitionNameItem(title: "Caffeine"),

                  ],
                ),
                SizedBox(height: context.height/150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      border: Border.all(
                        color: colorF7F7F8
                      ),
                        color: colorF7F7F8
                      ),
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: ImageHandler(img: ware1
                            , width: context.width/10, height: context.width/10),
                      ),
                    ),
                    SizedBox(width: context.width/50,),
                    Text("الريان فارم لتجاره وتوزيع الادويه",style: TextStyles.textStyleNormal10.copyWith(
                      color: color6C6C89,
                      fontWeight: FontWeight.w600
                    ),textScaler: TextScaler.linear(1),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("٥٨",style: TextStyles.textStyleNormal16.copyWith(
                      color: color121217,
                      fontWeight: FontWeight.w600
                    ),textScaler: TextScaler.linear(1),),
                    SizedBox(width: context.width/30,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ Text("جنيه مصري",style: TextStyles.textStyleNormal11.copyWith(
                          color: color6C6C89,
                          fontWeight: FontWeight.w400
                      ),textScaler: TextScaler.linear(1),),
                        SizedBox(width: context.width/30,),
                        Text("١٢٠ جنيه مصري",style: TextStyles.textStyleNormal11.copyWith(
                            color: color6C6C89,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: color6C6C89,
                            fontWeight: FontWeight.w400
                        ),textScaler: TextScaler.linear(1),),],
                    ),
                    Spacer(),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: context.width/60,
                          vertical: context.height/70),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorFEF0F4,
                          border: Border.all(
                              color: colorFBB1C4
                          )),
                      child: Text("خصم ٥٢٪",style: TextStyles.textStyleNormal11.copyWith(
                          color: colorD50B3E,
                          fontWeight: FontWeight.w600
                      ),textScaler: TextScaler.linear(1),),
                    )
                  ],),

              ],
            ),
          )
        ],
      ),
    );
  }
}