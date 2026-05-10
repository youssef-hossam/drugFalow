import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/constants/images.dart';
import 'package:drug_flow/core/constants/styles.dart';
import 'package:drug_flow/core/widgets/svg_handler.dart';
import 'package:drug_flow/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/products/presentation/widgets/product_grid_item.dart';
import 'package:drug_flow/features/products/presentation/widgets/product_item.dart';
import 'package:drug_flow/features/products/presentation/widgets/products_filter_item.dart';
import 'package:drug_flow/features/products/presentation/widgets/ware_house_item_horizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/search_field_txt.dart';
import '../../../../core/widgets/silver_grid_delegate_with_fixed_axis_count/silver_grid_delegate_with_fixed_axis_count.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget{
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with SingleTickerProviderStateMixin{
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<ProductsCubit>().tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.6.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.5.w),
            child: Text("المنتجات",style: TextStyles.textStyleBold20.copyWith(
              color: color121217
            ),textScaler: TextScaler.linear(1),),
          ),
          SizedBox(height: 16.2.h,),
          SearchFieldTxt(searchController: searchController),
          SizedBox(height: 16.2.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.8.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          WareHouseItemHorizontal(),
                          WareHouseItemHorizontal(),
                          WareHouseItemHorizontal(),
                          WareHouseItemHorizontal(),
                          WareHouseItemHorizontal(),
                        ]

                    )),
                SizedBox(height: 32.5.h,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            height: 54.1.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: color121217.withOpacity(.1),
                              ),
                            ),
                            child: BlocBuilder<ProductsCubit, ProductsState>(
                              builder: (context, state) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            context.read<ProductsCubit>().updateTabIndex(ind: 0);
                                          },
                                          child: Container(
                                            width:53.6.w,
                                            decoration: BoxDecoration(
                                              color: context.read<ProductsCubit>().index == 0?
                                              colorF7F7F8: white,

                                            ),
                                            alignment:Alignment.center,
                                            child: customSvg(name: menu,width: 12.5.w
                                                ,height: 27.1.h,fit: BoxFit.cover,
                                                color:  context.read<ProductsCubit>().index == 0?
                                                primaryDark :color8A8AA3),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: color121217.withOpacity(.2),
                                          width: 0,
                                          thickness: 2,
                                        ),
                                        InkWell(
                                          onTap:(){
                                            context.read<ProductsCubit>().updateTabIndex(ind: 1);
                                          },
                                          child: Container(
                                            width:53.6.w,
                                            alignment:Alignment.center,
                                            decoration: BoxDecoration(
                                              color:  context.read<ProductsCubit>().index == 1?
                                              colorF7F7F8: white,
                                            ),

                                            child: customSvg(name: grid,width: 12.5.w
                                                ,height: 27.1.h,fit: BoxFit.cover,
                                                color:  context.read<ProductsCubit>().index == 1?
                                                primaryDark :color8A8AA3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 9.4.w,),
                           Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12.5.w,
                                        vertical: 16.2.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: color121217.withOpacity(.05),
                                        )),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment:Alignment.center,
                                          child: customSvg(name: arrows,width: 7.5.w
                                              ,height: 16.2.h,fit: BoxFit.cover),
                                        ),
                                        SizedBox(width: 7.5.w,),
                                        Text("ترتيب حسب",style: TextStyles.textStyleNormal14.copyWith(
                                            color: color121217
                                        ),textScaler: TextScaler.linear(1),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 9.4.w,),
                                  ProductsFilterItem(title:"الدواء"),
                                  SizedBox(width: 9.4.w,),
                                  ProductsFilterItem(title:"المادة الفعالة")

                                ],)])),],),),
          SizedBox(height: 27.1.h,),
          Expanded(child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
              controller:     context.read<ProductsCubit>().tabController,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 16.2.h,
                        horizontal: 12.5.w),
                    itemCount: 8,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index)=>ProductItem()),
                GridView.builder(
                shrinkWrap: true,
                    itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    height: 427.4.h,
                    crossAxisSpacing: 5.4.w,
                    mainAxisSpacing: 10.2.h,
                    crossAxisCount: 2),
                    itemBuilder: (context,index)=>ProductGridItem())

                
              ]);
  },
)),
        ],
      ),
    );
  }
}