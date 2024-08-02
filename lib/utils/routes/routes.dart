import 'package:flutter/material.dart';
import 'package:providerprac/utils/routes/routes_name.dart';
import 'package:providerprac/view/home_view.dart';
import 'package:providerprac/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
