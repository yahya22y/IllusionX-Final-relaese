import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:IllusionX/presentation/login_screen/login_screen.dart';
import 'package:IllusionX/presentation/signup_screen/signup_screen.dart';
import '../presentation/chatbot_draweritem/chatbot_draweritem.dart';
import '../presentation/forget_screen/forget_screen.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/chatbot_screen/chatbot_screen.dart';
import '../presentation/devices_screen/devices_screen.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/onboarding_second_screen/onboarding_second_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/splash_one_screen/splash_one_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String splash_screen = '/splash_one_dart';
  static const String chatbotScreen = '/chatbot_screen';
  static const String homeScreen = '/home_screen';
  static const String deviceScreen = '/devices_screen';
  static const String initialRoute = '/initialRoute';
  static const String settingsScreen = '/settings_screen';
  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String forgetScreen = '/forget_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String chatbotlistScreen = '/chatbot_draweritem';
  static const String profileScreen = '/profile_screen';
  static const String appSettigsScreen = '/app_settigs_screen';
  static const String onboardingScreen = '/onboarding_screen';
  static const String onboardingSecondScreen = '/onboarding_second_screen';

  static Map<String, WidgetBuilder> routes = {
    onboardingSecondScreen: (context) => OnboardingSecondScreen(),
    onboardingScreen: (context) => OnboardingScreen(),
    splashScreen: (context) => SplashScreen(),
    splash_screen: (context) => SplashOneScreen(),
    loginScreen: (context) => LoginScreen(),
    signupScreen: (context) => SignupScreen(),
    chatbotScreen: (context) => ChatbotTwoScreen(),
    initialRoute: (context) => SplashScreen(),
    forgetScreen: (context) => ForgetScreen(),
    homeScreen: (context) => HomeScreen(),
    deviceScreen: (context) => DevicesScreen(),
    settingsScreen: (context) => SettingsScreen(),
    chatbotlistScreen: (context) => ChatbotDraweritem(),
    profileScreen: (context) => ProfileScreen(),
  };
}
