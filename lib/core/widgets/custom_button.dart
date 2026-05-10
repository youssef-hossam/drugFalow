import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/helper.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  TextStyle? style;
  BorderSide? borderSide;
  final Function()? onPressed;
  bool? isLoading;
  String? font;
  String? type;
  String? svgIcon;
  String? iconName;
  Color? color;
  bool? isNextButton;
  CustomButton({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.isLoading = false,
    this.type = "",
    this.svgIcon = "",
    this.iconName = "",
    this.color = primaryDark,
    this.style,
    this.borderSide,
    this.isNextButton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      elevation: 0,
      color: color,
      height: 40.h,

      padding: EdgeInsets.only(left: 0, bottom: 10.2.h, top: 10.2.h),
      shape: RoundedRectangleBorder(
        side: borderSide ?? BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: isLoading == true
          ? CircularProgressIndicator(color: white, strokeWidth: 2.0)
          : isNextButton == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  btnTitle,
                  style:
                      style ??
                      TextStyles.textStyleNormal14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                  textScaler: TextScaler.linear(1),
                ),
                SizedBox(width: 10.w),
                Transform.flip(
                  flipX: context.locale.languageCode == 'ar',
                  child: customSvg(
                    name: back,
                    fit: BoxFit.fitWidth,
                    color: white,
                    width: 17.5.w,
                    height: 13.5.h,
                  ),
                ),
              ],
            )
          : Text(
              btnTitle,
              style:
                  style ??
                  TextStyles.textStyleNormal14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
              textScaler: TextScaler.linear(1),
            ),
    );
  }
}
