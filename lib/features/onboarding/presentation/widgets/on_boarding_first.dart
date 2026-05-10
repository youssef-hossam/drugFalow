import 'package:drug_flow/core/widgets/image_handler.dart';
import 'package:flutter/cupertino.dart';

class OnBoardingFirst extends StatelessWidget {
  final String img;

  const OnBoardingFirst({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ImageHandler(
        img: img,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
