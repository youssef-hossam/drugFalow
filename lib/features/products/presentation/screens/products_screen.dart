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
          SizedBox(height: context.height/70,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/30),
            child: Text("المنتجات",style: TextStyles.textStyleBold20.copyWith(
              color: color121217
            ),textScaler: TextScaler.linear(1),),
          ),
          SizedBox(height: context.height/50,),
          SearchFieldTxt(searchController: searchController),
          SizedBox(height: context.height/50,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width/20),
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
                SizedBox(height: context.height/25,),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            height: context.height/15,
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
                                            width:context.width/7,
                                            decoration: BoxDecoration(
                                              color: context.read<ProductsCubit>().index == 0?
                                              colorF7F7F8: white,

                                            ),
                                            alignment:Alignment.center,
                                            child: customSvg(name: menu,width: context.width/30
                                                ,height: context.height/30,fit: BoxFit.cover,
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
                                            width:context.width/7,
                                            alignment:Alignment.center,
                                            decoration: BoxDecoration(
                                              color:  context.read<ProductsCubit>().index == 1?
                                              colorF7F7F8: white,
                                            ),

                                            child: customSvg(name: grid,width: context.width/30
                                                ,height: context.height/30,fit: BoxFit.cover,
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
                          SizedBox(width: context.width/40,),
                           Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: context.width/30,
                                        vertical: context.height/50),
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
                                          child: customSvg(name: arrows,width: context.width/50
                                              ,height: context.height/50,fit: BoxFit.cover),
                                        ),
                                        SizedBox(width: context.width/50,),
                                        Text("ترتيب حسب",style: TextStyles.textStyleNormal14.copyWith(
                                            color: color121217
                                        ),textScaler: TextScaler.linear(1),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: context.width/40,),
                                  ProductsFilterItem(title:"الدواء"),
                                  SizedBox(width: context.width/40,),
                                  ProductsFilterItem(title:"المادة الفعالة")

                                ],)])),],),),
          SizedBox(height: context.height/30,),
          Expanded(child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
              controller:     context.read<ProductsCubit>().tabController,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: context.height/50,
                        horizontal: context.width/30),
                    itemCount: 8,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index)=>ProductItem()),
                GridView.builder(
                shrinkWrap: true,
                    itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    height: context.height/1.9,
                    crossAxisSpacing: context.width/70,
                    mainAxisSpacing: context.height/80,
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