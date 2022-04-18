// <copyright file="navigation_route.dart" company="AcerPro Bilişim Teknolojileri A.Ş.">
//     Copyright (c)
// </copyright>

import 'package:flutter/material.dart';
import 'package:random_question/views/random_question/view/random_question_view.dart';

import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_PAGE:
        return _normalNavigate(RandomQuestionView(), args);
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("Sayfa bulunamadı."),
                  ),
                ));
    }
  }

  //Flutter default navigate işlemi
  MaterialPageRoute _normalNavigate(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
