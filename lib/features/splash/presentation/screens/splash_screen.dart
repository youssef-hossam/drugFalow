import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/videos.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        setState(() {});
        controller.play();
      });

    context.read<SplashCubit>().setSplash(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: primaryDark,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
