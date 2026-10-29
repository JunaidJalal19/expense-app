import 'package:expens_app/routers/bottom_bar.dart';
import 'package:expens_app/screens/auth/login_screen.dart';
import 'package:expens_app/screens/auth/sign_up_screen.dart';
import 'package:expens_app/screens/deshboard/home_screen.dart';
import 'package:expens_app/screens/deshboard/intro_screen.dart';
import 'package:expens_app/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';

  class AppRouter {
    static const splash_screen = "/";
    static const login_screen = "/login";
    static const sign_up_screen = "/signUp";
    static const intro_screen = "/app-intro";
    static const home_screen = "/home";

    static final Map<String, WidgetBuilder> appRoutes = {
      splash_screen : (context) => SplashScreen(),
      login_screen : (context) => LoginScreen(),
      sign_up_screen : (context) => SignUpScreen(),
      intro_screen : (context) => IntroScreen(),
      home_screen : (context) => BottomBar(),

    };




  }