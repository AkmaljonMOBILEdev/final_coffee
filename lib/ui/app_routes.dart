import 'package:final_coffee/ui/splash/splash_screen.dart';
import 'package:final_coffee/ui/tab_box/cart/cart_screen.dart';
import 'package:final_coffee/ui/tab_box/home/home_screen.dart';
import 'package:final_coffee/ui/tab_box/home/sub_screens/detailed_screen.dart';
import 'package:final_coffee/ui/tab_box/profile/profile_screen.dart';
import 'package:final_coffee/ui/tab_box/search/search_screen.dart';
import 'package:final_coffee/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';

import '../data/models/coffee_model/coffee_model.dart';
import 'add_screen/add_screen.dart';
import 'onboarding/onboarding_screen.dart';
import 'onboarding/sub_screens/admin_login.dart';

class RouteNames {
  static const String splash = "/";
  static const String onBoarding = "/on_boarding";
  static const String tabBox = "/tab_box";
  static const String home = "/home";
  static const String search = "/search";
  static const String cart = "/cart";
  static const String profile = "/profile";
  static const String detailed = "/detailed";
  static const String adminLogin = "/admin_login";
  static const String add = "/add";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBox());
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteNames.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case RouteNames.cart:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RouteNames.adminLogin:
        return MaterialPageRoute(builder: (context) => const AdminLoginScreen());
      case RouteNames.add:
        return MaterialPageRoute(builder: (context) => const AddScreen());
      case RouteNames.detailed:
        return MaterialPageRoute(builder: (context) =>  CoffeeDetailedScreen(coffeeModel: settings.arguments as CoffeeModel));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("Error!"),
                  ),
                ));
    }
  }
}
