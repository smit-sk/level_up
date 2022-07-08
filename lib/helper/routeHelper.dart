// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:get/get.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/bodyFat.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/createAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/getStartedCreateAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/result.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step01CreateAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step02CreateAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/step03CreateAccount.dart';
import 'package:levelup/view/screens/Auth/CreateNewAccount/weighIn.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/SignInCreate.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/resetPassword.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/resetPasswordDone.dart';
import 'package:levelup/view/screens/Auth/Sign%20In/signIn.dart';
import 'package:levelup/view/screens/Meal%20Plan/MealPan.dart';
import 'package:levelup/view/screens/dashboard.dart';
import 'package:levelup/view/screens/splashScreen.dart';

import '../view/screens/Auth/CreateNewAccount/step04CreateAccount.dart';
import '../view/screens/Auth/CreateNewAccount/step05CreateAccount.dart';

class RouteHelper {
  //static const String  = '/';
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signInCreateAc = '/signIn-createAccount';
  static const String signIn = '/sign-in';
  static const String createAccount = "/create-account";
  static const String resetPassword = '/reset-password';
  static const String resetPasswordDone = '/reset-password-done';
  static const String step01CreateAccount = '/step01-create-account';
  static const String step02CreateAccount = '/step02-create-account';
  static const String step03CreateAccount = '/step03-create-account';
  static const String step04CreateAccount = '/step04-create-account';
  static const String step05CreateAccount = '/step05-create-account';
  static const String weighInCreateAccount = '/weigh-in-create-account';
  static const String bodyFatCreateAccount = '/body-fat-create-account';
  static const String resultCreateAccount = '/result-create-account';
  static const String getStartedToApp = '/get-started-to-app';

  static const String dashboard = '/dashboard';

  static const String mealPlan = '/meal-plan';

  // static String getRoute() => '$';
  static String getInitialRoute() => initial;
  static String getSplashRoute() => '$splash';
  static String getSignInCreateAccountRoute() => '$signInCreateAc';
  static String getSIgnInRoute() => '$signIn';
  static String getCreateAccountRoute() => '$createAccount';
  static String getResetPasswordRoute() => '$resetPassword';
  static String getResetPasswordDoneRoute() => '$resetPasswordDone';
  static String getStep01CreateAccountRoute() => '$step01CreateAccount';
  static String getStep02CreateAccountRoute() => '$step02CreateAccount';
  static String getStep03CreateAccountRoute() => '$step03CreateAccount';
  static String getStep04CreateAccountRoute() => '$step04CreateAccount';
  static String getStep05CreateAccountRoute() => '$step05CreateAccount';
  static String getWeighInCreateAccountRoute() => '$weighInCreateAccount';
  static String getBodyFatCreateAccountRoute() => '$bodyFatCreateAccount';
  static String getResultCreateAccountRoute() => '$resultCreateAccount';
  static String getGetStartedtoAppRoute() => '$getStartedToApp';

  static String getDashboardRoute() => '$dashboard';

  static String getMealPlanRoute() => '$mealPlan';
  // static String getRoute() => '$';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => SplashScreen()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: signInCreateAc, page: () => SignInCreate()),
    GetPage(name: signIn, page: () => SignIn()),
    GetPage(name: createAccount, page: () => CreateAccount()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(name: resetPasswordDone, page: () => ResetPasswordDone()),
    GetPage(name: step01CreateAccount, page: () => Step01CreateAccount()),
    GetPage(name: step02CreateAccount, page: () => Step02CreateAccount()),
    GetPage(name: step03CreateAccount, page: () => Step03CreateAccount()),
    GetPage(name: step04CreateAccount, page: () => Step04CreateAccount()),
    GetPage(name: step05CreateAccount, page: () => Step05CreateAccount()),
    GetPage(name: weighInCreateAccount, page: () => WeighIn()),
    GetPage(name: bodyFatCreateAccount, page: () => BodyFat()),
    GetPage(name: resultCreateAccount, page: () => ResultCA()),
    GetPage(name: getStartedToApp, page: () => GetStartedCreateAccount()),

    GetPage(name: dashboard, page: () => Dashboard()),

    GetPage(name: mealPlan, page: () => MealPlan()),
    //GetPage(name: , page: () => ),
    //GetPage(name: , page: () => ),
    //GetPage(name: , page: () => ),
    //GetPage(name: , page: () => ),
  ];
}
