import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/svg_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> buildAroundWidgets(BuildContext context) {
  final radius = 75.w / 2 + 12;

  final widgets = [
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: 25.w,
        height: 25.w,
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: 20.8.w,
      height: 20.8.w,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: 25.w,
        height: 25.w,
        fit: BoxFit.cover,
      ),
    ),

    Container(
      width: 20.8.w,
      height: 20.8.w,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: 25.w,
        height: 25.w,
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: 20.8.w,
      height: 20.8.w,
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: colorF7F7F8,
        shape: BoxShape.circle,
        border: Border.all(color: white),
      ),
      child: customSvg(
        name: garage,
        width: 25.w,
        height: 25.w,
        fit: BoxFit.cover,
      ),
    ),

    // Add more different widgets here...
  ];

  return List.generate(widgets.length, (index) {
    final angle = (index * 2 * pi) / widgets.length;

    return Positioned(
      left: radius * cos(angle),
      top: radius * sin(angle),
      child: widgets[index],
    );
  });
}