import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadItemWidget extends StatelessWidget{
  final String img;
  final String title;
  final String description;


  UploadItemWidget({required this.img,required this.title,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 75.w,
          height: 81.2.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: colorD1d1dB
            )),
          child: customSvg(name: img,width: 25.w,
          height: 54.1.h,fit: BoxFit.cover),
        ),
        SizedBox(width: 12.5.w,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,style: TextStyles.textStyleNormal14.copyWith(
                fontWeight: FontWeight.w600
              ),textScaler: TextScaler.linear(1),),
              SizedBox(height: 9.h,),
              Text(description,style: TextStyles.textStyleNormal11.copyWith(
                color: color6C6C89,
                  fontWeight: FontWeight.w600
              ),textScaler: TextScaler.linear(1),),
            ],
          ),
        )
      ],
    );
  }
}