import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection_container/injection_container.dart' as di;
import 'core/constants/colors.dart';
import 'go_routes.dart';

final GlobalKey<ScaffoldMessengerState> msgKey = GlobalKey();
final GlobalKey<NavigatorState> navKey = GlobalKey();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await EasyLocalization.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // <-- your GoRouter instance

      scaffoldMessengerKey: msgKey,


      debugShowCheckedModeBanner: false,

    /*  locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,*/

      // ❌ REMOVE THIS (GoRouter handles navigation)
      // navigatorKey: navKey,

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          constraints: BoxConstraints(maxWidth: double.infinity),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: white),
      ),
    );
  }
}
