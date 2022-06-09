import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:random_question/core/extension/string_extension.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../products/widgets/text/custom_text.dart';

class MainPageViewModel extends ChangeNotifier {
  final _addItemBox = Hive.box('box');

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _isQuestionAddedOldest = false;

  bool get isQuestionAddedOldest => _isQuestionAddedOldest;

  set isQuestionAddedOldest(bool isQuestionAddedOldest) {
    _isQuestionAddedOldest = isQuestionAddedOldest;
    notifyListeners();
  }

  // Create new item
  Future<void> createItem(
      Map<String, dynamic> newItem, BuildContext context) async {
    await _addItemBox.add(newItem);
    var snackBar = SnackBar(
      action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
      behavior: SnackBarBehavior.floating,
      content: CustomText(text: LocaleKeys.main_page_add_favorite.locale),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
