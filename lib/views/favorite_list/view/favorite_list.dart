import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/products/widgets/app_bar/custom_appbar.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';
import 'package:random_question/views/favorite_list/view-model/favorite_list_view_model.dart';

class FavoriteListView extends StatefulWidget {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  State<FavoriteListView> createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  final FavoriteListViewModel _favoriteListViewModel = FavoriteListViewModel();

  @override
  void initState() {
    _favoriteListViewModel.refreshItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteService = Provider.of<FavoriteListViewModel>(context);

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.favorite_list_header.locale,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Consumer<FavoriteListViewModel>(
                builder: ((context, value, child) {
                  value.refreshItems();
                  return value.items.isNotEmpty
                      ? ListView.builder(
                          itemCount: value.items.length,
                          itemBuilder: (context, i) {
                            return Card(
                              elevation: 4,
                              shadowColor: Colors.black,
                              child: ListTile(
                                title: CustomText(
                                  text: (i + 1).toString(),
                                  textStyle: const TextStyle(fontSize: 14),
                                ),
                                subtitle: CustomText(
                                  text: value.items[i]['text'],
                                  textStyle: const TextStyle(fontSize: 13),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    favoriteService.deleteItem(
                                        value.items[i]['key'], context);
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CustomText(
                            text: LocaleKeys.favorite_list_emty_favorite.locale,
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
