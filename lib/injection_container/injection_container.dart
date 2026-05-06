import 'package:drug_flow/core/utils/api_base_helper.dart';
import 'package:drug_flow/features/auth/auth_inj.dart';
import 'package:drug_flow/features/bottom_bar/bottom_bar_inj.dart';
import 'package:drug_flow/features/cart/cart_inj.dart';
import 'package:drug_flow/features/home/home_inj.dart';
import 'package:drug_flow/features/notifications/notifications_inj.dart';
import 'package:drug_flow/features/onboarding/on_boarding_inj.dart';
import 'package:drug_flow/features/orders/orders_inj.dart';
import 'package:drug_flow/features/products/products_inj.dart';
import 'package:drug_flow/features/profile/profile_inj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
late SharedPreferences sharedPreferences;
late ApiBaseHelper helper;
final GetIt sl = GetIt.instance;

Future<void>init()async {
  sharedPreferences = await SharedPreferences.getInstance();
  helper = ApiBaseHelper();
  helper.dioInit();
  sl.registerLazySingleton(()=>helper);
  sl.registerLazySingleton(()=>sharedPreferences);


  await initAuthInj(sl);
  await initHomeInj(sl);
  await initCartInj(sl);
  await initNotificationsInj(sl);
  await initOrdersInj(sl);
  await initProductsInj(sl);
  await initProfileInj(sl);
  await initOnBoardingInj(sl);
  await initBottomBarInj(sl);
}