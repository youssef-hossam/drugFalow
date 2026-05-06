import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/helper.dart';

class PartitionNameItem extends StatelessWidget{
  final String title;

  PartitionNameItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width/50,
          vertical: context.height/60),
      decoration: BoxDecoration(
        color: colorF7F7F8,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title,style: TextStyles.textStyleNormal10.copyWith(
          color: color3F3F50
      ),textScaler: TextScaler.linear(1),),
    );
  }
}