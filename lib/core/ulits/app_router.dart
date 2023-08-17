import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/Login/presentation/views/login_view.dart';
import 'package:todo/features/home/presentation/views/home_view.dart';
import 'package:todo/features/register/presentation/views/register_view.dart';
import 'package:todo/features/splash/presentation/views/splash_view.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body1.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body2.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body3.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body4.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body5.dart';

abstract class AppRouter {
  static final kSplashViewBody1 = '/SplashViewBody1';
  static final kSplashViewBody2 = '/SplashViewBody2';
  static final kSplashViewBody3 = '/SplashViewBody3';
  static final kSplashViewBody4 = '/SplashViewBody4';
  static final kSplashViewBody5 = '/SplashViewBody5';
  static final kLoginView = '/LoginView';
  static final kRegisterView = '/RegisterView';
  static final kHomeView = '/HomeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kSplashViewBody2,
        builder: (context, state) => SplashViewBody2(),
      ),
      GoRoute(
        path: kSplashViewBody3,
        builder: (context, state) => SplashViewBody3(),
      ),
      GoRoute(
        path: kSplashViewBody4,
        builder: (context, state) => SplashViewBody4(),
      ),
      GoRoute(
        path: kSplashViewBody5,
        builder: (context, state) => SplashViewBody5(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
