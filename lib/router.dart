import 'package:crib_stock/view/export/export.dart';
import 'package:crib_stock/view/home_page/home_page.dart';
import 'package:flutter/material.dart';


import 'constants/route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {






      case RoutesConstants.HOME_PAGE:
        return MaterialPageRoute(
            builder: (_) => HomePage(), settings: settings);



      case RoutesConstants.Export:
        return MaterialPageRoute(
            builder: (_) => Export(), settings: settings);











      default:
      //return MaterialPageRoute(builder: (_) =>  Testing());
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));

    }
  }
}