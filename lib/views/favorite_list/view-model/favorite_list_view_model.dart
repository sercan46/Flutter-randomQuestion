import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';

class FavoriteListViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  set items(List<Map<String, dynamic>> items) {
    _items = items;
  }

  final _addItemBox = Hive.box('box');

  refreshItems() {
    items = [];
    final data = _addItemBox.keys.map((key) {
      final value = _addItemBox.get(key);
      return {"key": key, "id": value["id"], "text": value['text']};
    }).toList();
    items.addAll(data.reversed.toList());
    return items;
  }

  Future<dynamic> deleteItem(int itemKey, BuildContext context) async {
    await _addItemBox.delete(itemKey);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
        content: Text(LocaleKeys.favorite_list_delete_success.locale)));

    refreshItems();
  }
}
