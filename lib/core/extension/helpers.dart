import 'package:flutter/material.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';

class Helpers {
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: LocaleKeys.bottom_menu_random_question.locale,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.more_horiz),
      label: LocaleKeys.bottom_menu_add_question.locale,
    ),
  ];
}
