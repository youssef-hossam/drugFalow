import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorD1d1dB,)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add,
          color: color8A8AA3,)),
          SizedBox(width: context.width/100,),
          Text("٢",style: TextStyles.textStyleNormal14.copyWith(
            color: color121217,
            fontWeight: FontWeight.w600
          ),textScaler: TextScaler.linear(1),),
          SizedBox(width: context.width/100,),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove,
            color: color8A8AA3,)),
        ],
      ),
    );
  }
}