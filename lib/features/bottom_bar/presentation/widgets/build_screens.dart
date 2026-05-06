import 'package:drug_flow/core/constants/colors.dart';
import 'package:drug_flow/core/utils/helper.dart';
import 'package:drug_flow/features/cart/presentation/cubit/cart_items/cart_items_cubit.dart';
import 'package:drug_flow/features/cart/presentation/screens/cart_screen.dart';
import 'package:drug_flow/features/home/presentation/screens/home_screen.dart';
import 'package:drug_flow/features/products/presentation/cubit/products/products_cubit.dart';
import 'package:drug_flow/features/products/presentation/screens/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container/injection_container.dart';
List<Widget> screens({BuildContext? context}) =>
    [
      HomeScreen(),
      BlocProvider(
        create: (context) => sl<ProductsCubit>(),
        child: ProductsScreen(),
      ),
      BlocProvider(
        create: (context) => sl<CartItemsCubit>(),
        child: CartScreen(),
      ),


      Container()
    ];