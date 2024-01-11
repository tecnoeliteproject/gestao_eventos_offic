import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/view/sign_in_screen.dart';
import 'package:gestao_eventos/presentation/home/view/home_page.dart';
import 'package:gestao_eventos/presentation/splash/splash_screen.dart';

class GlobalRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/sign_in':
        return MaterialPageRoute(builder: (context) => SignInScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return null;
    }
  }
}

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
};
