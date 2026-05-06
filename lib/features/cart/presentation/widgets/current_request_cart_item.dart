import 'package:drug_flow/core/widgets/custom_button.dart';
import 'package:drug_flow/features/cart/presentation/widgets/counter_item.dart';
import 'package:drug_flow/features/cart/presentation/widgets/coupon_code_text.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/image_handler.dart';

class CurrentRequestCartItem extends StatefulWidget{
  const CurrentRequestCartItem({super.key});

  @override
  State<CurrentRequestCartItem> createState() => _CurrentRequestCartItemState();
}

class _CurrentRequestCartItemState extends State<CurrentRequestCartItem> {
  final TextEditingController couponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.height/50,
      horizontal: context.width/40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
              SizedBox(width: context.width/60,),
              Text("الريان فارم لتجاره وتوزيع الادويه",style: TextStyles.textStyleNormal10.copyWith(
                  color: color121217,
                  fontWeight: FontWeight.w600
              ),textScaler: TextScaler.linear(1),)
            ],
          ),
      Container(
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
                  SizedBox(height: context.height/90,),
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
                  SizedBox(height: context.height/40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterItem(),
                      SizedBox(
                        width: context.width/6.8,
                        child: CustomButton(btnTitle: "نقـل", onPressed:(){},
                        color: primaryDark,),
                      )
                    ],
                  )

                ],
              ),
            )
          ],
        ),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Text("ملخص الطلب",style: TextStyles.textStyleNormal16.copyWith(
              color: color121217,
              fontWeight: FontWeight.w600
            ),textScaler: TextScaler.linear(1),),
          ),
          SizedBox(height: context.height/120,),
          CouponCodeText(couponCodeController: couponCodeController),
          SizedBox(height: context.height/90,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("سعر الإجمالي",style: TextStyles.textStyleNormal16.copyWith(
                    color: color121217,
                    fontWeight: FontWeight.w500
                ),textScaler: TextScaler.linear(1),),
                Text("١٢٠ جنيه مصري",style: TextStyles.textStyleNormal12.copyWith(
                    color: color121217,
                    fontWeight: FontWeight.w600
                ),textScaler: TextScaler.linear(1),),

              ],
            ),
          ),
          SizedBox(height: context.height/90,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("السعر النهائي",style: TextStyles.textStyleNormal16.copyWith(
                    color: color121217,
                    fontWeight: FontWeight.w500
                ),textScaler: TextScaler.linear(1),),
                Text("١٠٠ جنيه مصري",style: TextStyles.textStyleNormal14.copyWith(
                    color: color121217,
                    fontWeight: FontWeight.w600
                ),textScaler: TextScaler.linear(1),),

              ],
            ),),
          SizedBox(height: context.height/60,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(btnTitle: "تأكيد الطلب", onPressed: (){}),
                CustomButton(btnTitle: "إلغاء الطلب", onPressed: (){},color: colorD50B3E,),
                CustomButton(btnTitle: "حفظ لوقت آخر", onPressed: (){},
                color: color121217,)
              ],
            ),
          )
        ],
      ),
    );
  }
}