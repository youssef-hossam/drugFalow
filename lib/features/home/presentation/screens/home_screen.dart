import 'dart:ui' as ui;

import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:drug_flow/core/widgets/search_field_txt.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/home/presentation/widgets/ware_houses_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.6.h,),
          SearchFieldTxt(searchController: searchController),
          SizedBox(height: 6.8.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.5.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageHandler(img: upscale, width: double.infinity
                  , height: 162.4.h),
            ),
          ),
      SizedBox(height: 9.h,),
      Center(
        child: SmoothPageIndicator(
            textDirection: ui.TextDirection.ltr,
            effect: ExpandingDotsEffect(
                spacing: 8.0,
                radius: 20.0,
                dotWidth: 6.2.w,
                dotHeight: 6.2.w,
                activeDotColor: color97C3D0,

                dotColor:colorCCE5EC),
            controller: PageController(initialPage: 0,),
            count: 3),
      ),
          SizedBox(height: 20.3.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.5.w),
            child: Text("جميع المخازن",style: TextStyles.textStyleNormal14.copyWith(
              color: color121217,
              fontWeight: FontWeight.w600
            ),textScaler: TextScaler.linear(1),),
          ),
          Expanded(child: GridView.builder(
            padding: EdgeInsets.symmetric(
                vertical: 13.5.h,
                horizontal: 12.5.w),
              itemCount: 21,
              shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  height: 162.4.h,
                  crossAxisSpacing: 5.4.w,
                  mainAxisSpacing: 16.2.h,
                  crossAxisCount: 3)
              , itemBuilder: (context,index)=>WareHousesItem()))
        ],
      ),
    );
  }
}