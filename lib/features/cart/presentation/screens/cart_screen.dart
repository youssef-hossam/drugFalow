import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/cart/presentation/cubit/cart_items/cart_items_cubit.dart';
import 'package:drug_flow/features/cart/presentation/widgets/current_request_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget{
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    context.read<CartItemsCubit>().setTabBar(provider: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height/30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Text("سلة المشتريات",style: TextStyles.textStyleBold20.copyWith(
              color: color121217
            ),textScaler: TextScaler.linear(1),),
          ),
          SizedBox(height: context.height/20,),
          Center(
            child: BlocBuilder<CartItemsCubit, CartItemsState>(
              builder: (context, state) {
                return SizedBox(
                  child: TabBar(
                  controller: context.read<CartItemsCubit>().tabController,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  onTap: (val){
                    context.read<CartItemsCubit>().updateTabIndex(ind: val);
                  },
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      height: context.height/10,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.read<CartItemsCubit>().tabController!.index == 0?
                          primaryDark : white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            customSvg(name: orders,width: context.width/30,
                            height: context.height/30,fit: BoxFit.cover,
                            color: context.read<CartItemsCubit>().tabController!.index ==0 ?
                            white: primaryDark),
                            Text("Current Requests",style: TextStyles.textStyleNormal16.copyWith(
                              color: context.read<CartItemsCubit>().tabController!.index == 0 ?
                              white : primaryDark
                            ),textScaler: TextScaler.linear(1),)
                          ],
                        ),
                      ),
                    ),
                    Tab(height: context.height/10,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:context.read<CartItemsCubit>().tabController!.index == 1?
                            primaryDark : white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            customSvg(name: bookmark,width: context.width/30,
                                height: context.height/30,fit: BoxFit.cover,
                                color: context.read<CartItemsCubit>().tabController!.index ==1 ?
                                white: primaryDark),
                            Text("Saved for later",style: TextStyles.textStyleNormal16.copyWith(
                                color: context.read<CartItemsCubit>().tabController!.index == 0 ?
                                primaryDark : white
                            ),textScaler: TextScaler.linear(1),)
                          ],
                        ),
                      ),
                    ),]),);},),
          ),
          Expanded(child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
              controller: context.read<CartItemsCubit>().tabController,
              children: [
                ListView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>CurrentRequestCartItem()),
                Container()
              ]))

        ],
      ),
    );
  }
}