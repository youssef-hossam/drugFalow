import 'package:drug_flow/core/constants/screens.dart';
import 'package:drug_flow/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:drug_flow/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:drug_flow/features/auth/presentation/screen/login_screen.dart';
import 'package:drug_flow/features/auth/presentation/screen/register_screen.dart';
import 'package:drug_flow/features/bottom_bar/presentation/cubit/bottom_bar_cubit.dart';
import 'package:drug_flow/features/bottom_bar/presentation/screens/bottom_bar_screen.dart';
import 'package:drug_flow/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:drug_flow/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:drug_flow/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:drug_flow/injection_container/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'features/splash/presentation/screens/splash_screen.dart';


final GoRouter router = GoRouter(
    navigatorKey: navKey,
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => SplashCubit(),
            child: SplashScreen(),),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: onboardingSc,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<OnboardingCubit>(),
            child: OnBoardingScreen(),
),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: loginSc,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: bottomBarSc,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => sl<BottomBarCubit>(),
            child: BottomBarScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    ]);

/*final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: splash,
  routes: [

    /// Splash
    GoRoute(
      path: splash,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<SplashCubit>(),
          child: SplashScreen(),
        ),
      ),
    ),

    /// Onboarding
    GoRoute(
      path: onboardingSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OnBoardingCubit>(),
          child: OnBoardingScreen(),
        ),
      ),
    ),

    /// Login
    GoRoute(
      path: login,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<LoginCubit>(),
          child: LoginScreen(),
        ),
      ),
    ),

    /// OTP (with params)
    GoRoute(
      path: otpSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<OtpCubit>()),
            BlocProvider(create: (_) => sl<ForgotPasswordCubit>()),
          ],
          child: OtpScreen(
            params: state.extra as OtpParams,
          ),
        ),
      ),
    ),

    /// Bottom Bar
    GoRoute(
      path: bottomBarSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<ProfileCubit>()),
            BlocProvider(create: (_) => sl<BottomBarCubit>()),
            BlocProvider(create: (_) => sl<CartCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
            BlocProvider(create: (_) => sl<NotificationsCubit>()),
          ],
          child: BottomBarScreen(),
        ),
      ),
    ),

    /// Product Details
    GoRoute(
      path: productSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<ProductCubit>(),
          child: ProductDetailsScreen(
            params: state.extra as ProductsParams,
          ),
        ),
      ),
    ),

    /// Orders
    GoRoute(
      path: ordersSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OrdersCubit>(),
          child: OrdersScreen(),
        ),
      ),
    ),

    /// Order Details
    GoRoute(
      path: orderDetailsSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: BlocProvider(
          create: (_) => sl<OrderDetailsCubit>(),
          child: OrderDetailsScreen(
            params: state.extra as OrdersParams,
          ),
        ),
      ),
    ),

    /// Cart
    GoRoute(
      path: cartSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: state.extra as CartCubit,
            ),
            BlocProvider(create: (_) => sl<FavouritesCubit>()),
            BlocProvider(create: (_) => sl<ConfirmOrderCubit>()),
          ],
          child: CartScreen(),
        ),
      ),
    ),

    /// Wholesale (your example)
    GoRoute(
      path: wholesaleSc,
      pageBuilder: (context, state) => AnimationRoute.fadeTransition(
        state: state,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<BottomBarCubit>()),
            BlocProvider(create: (_) => sl<ShopsCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
          ],
          child: ShopsScreen(type: 'sub'),
        ),
      ),
    ),

  ],
);*/