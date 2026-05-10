import "package:drug_flow/core/constants/images.dart";
import "package:drug_flow/core/constants/styles.dart";
import "package:drug_flow/core/utils/helper.dart";
import "package:drug_flow/core/widgets/svg_handler.dart";
import "package:flutter/cupertino.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import "../../../../core/constants/colors.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<PersistentBottomNavBarItem> navBarsItems({BuildContext? context}) => [
  PersistentBottomNavBarItem(
    icon: customSvg(
      name: homeFill,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: home,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    title: "Home",
    textStyle: TextStyles.textStyleNormal13,
    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white, // 🔥 THIS controls text in style10
  ),
  PersistentBottomNavBarItem(
    icon: customSvg(
      name: unionFill,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: union,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    title: "Add",
    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white,
  ),

  PersistentBottomNavBarItem(
    icon: customSvg(
      name: bagFill,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: bag,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    title: "Bag",
    activeColorPrimary: primaryDark, // ✅ active text color
    inactiveColorPrimary: color6C6C89,
    activeColorSecondary: white,
  ),

  PersistentBottomNavBarItem(
    icon: customSvg(
      name: userFill,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    inactiveIcon: customSvg(
      name: user,
      width: 25.w,
      height: 32.5.h,
      fit: BoxFit.cover,
    ),
    title: "Profile",
    activeColorPrimary: primaryDark,
    inactiveColorPrimary: colorEBEBEF,
    activeColorSecondary: white,
  ),
];
