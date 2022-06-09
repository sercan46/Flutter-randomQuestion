import 'package:flutter/material.dart';
import 'package:random_question/views/add_question/view/add_question_view.dart';
import 'package:random_question/views/favorite_list/view/favorite_list.dart';
import 'package:random_question/views/information_app/information_app_view.dart';
import 'package:random_question/views/main_page/view/main_page_view.dart';
import 'package:random_question/views/random_question/view/random_question_view.dart';
import 'package:random_question/views/select_language/view/select_language_view.dart';
import 'package:random_question/views/settings_page/view/settings_page_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFUALT:
        return _normalNavigate(const MainPageView(), args);
      case NavigationConstants.HOME_PAGE:
        return _normalNavigate(const RandomQuestionView(), args);
      case NavigationConstants.ADD_QUESTION:
        return _normalNavigate(const AddQuestionView(), args);
      case NavigationConstants.FAVORITE_LIST:
        return _normalNavigate(const FavoriteListView(), args);
      case NavigationConstants.SELECT_LANGUAGE:
        return _normalNavigate(const SelectedLanguageView(), args);
      case NavigationConstants.SETTING_PAGE:
        return _normalNavigate(const SettingsPageView(), args);
      case NavigationConstants.INFORMATION_APP:
        return _normalNavigate(const InformationAppView(), args);
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
