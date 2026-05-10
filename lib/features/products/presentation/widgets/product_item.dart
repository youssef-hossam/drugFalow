import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/features/products/presentation/widgets/partition_name_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.5.w,
      vertical: 16.2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ImageHandler(img: panadol, width: 107.1.w
                , height: 162.4.h),
          ),
          SizedBox(width: 12.5.w,),
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
                SizedBox(height: 16.2.h,),
                Text("اسم القسم",style: TextStyles.textStyleNormal11.copyWith(
                  color: color6C6C89
                ),textScaler: TextScaler.linear(1),),
                SizedBox(height: 9.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PartitionNameItem(title: "Paracetamol"),
                    SizedBox(width: 12.5.w,),
                    PartitionNameItem(title: "Caffeine"),

                  ],
                ),
                SizedBox(height: 5.4.h,),
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
                            , width: 37.5.w, height: 37.5.w),
                      ),
                    ),
                    SizedBox(width: 7.5.w,),
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
                    SizedBox(width: 12.5.w,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ Text("جنيه مصري",style: TextStyles.textStyleNormal11.copyWith(
                          color: color6C6C89,
                          fontWeight: FontWeight.w400
                      ),textScaler: TextScaler.linear(1),),
                        SizedBox(width: 12.5.w,),
                        Text("١٢٠ جنيه مصري",style: TextStyles.textStyleNormal11.copyWith(
                            color: color6C6C89,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: color6C6C89,
                            fontWeight: FontWeight.w400
                        ),textScaler: TextScaler.linear(1),),],
                    ),
                    Spacer(),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.2.w,
                          vertical: 11.6.h),
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