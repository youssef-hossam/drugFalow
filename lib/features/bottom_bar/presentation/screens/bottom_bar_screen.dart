import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/features/bottom_bar/presentation/widgets/build_screens.dart';
import 'package:drug_flow/features/bottom_bar/presentation/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import '../../../../core/constants/colors.dart';
import '../widgets/nav_bar_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late PersistentTabController controller;

  @override
  void initState() {
    controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context: context),
      backgroundColor: white,

      body: PersistentTabView(
        context,
        controller: controller,

        screens: screens(context: context),
        items: navBarsItems(context: context),

        handleAndroidBackButtonPress: true,

        resizeToAvoidBottomInset: false,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,

        popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,

        padding: const EdgeInsets.only(top: 8),

        onWillPop: (context) async {
          if (controller.index != 0) {
            controller.jumpToTab(0);
            return false;
          }
          return true;
        },

        backgroundColor: white, // 🔥 FIX BLACK SCREEN

        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,

            duration: Duration(milliseconds: 250),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),

        confineToSafeArea: true,
        navBarHeight: 85.5.h,

        navBarStyle: NavBarStyle.style10,
      ),
    );
  }
}
