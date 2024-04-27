import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/sign_up_screen.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/register_stock.dart';
import 'package:gestao_eventos/presentation/painels/admin/splash/splash_screen.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/admin_screen.dart';
import 'package:gestao_eventos/presentation/painels/client/client_home_screen.dart';

class GlobalRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case ClientHomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ClientHomeScreen(),
        );
      case AdminScreen.routeName:
        return MaterialPageRoute(builder: (context) => const AdminScreen());
      default:
        return null;
    }
  }
}

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const RegisterStockPage(),
};
