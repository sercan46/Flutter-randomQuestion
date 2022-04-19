import 'package:flutter/material.dart';
import 'package:random_question/products/widgets/app_bar/custom_appbar.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';

class FavoriteListView extends StatefulWidget {
  const FavoriteListView({Key? key}) : super(key: key);

  @override
  State<FavoriteListView> createState() => _FavoriteListViewState();
}

class _FavoriteListViewState extends State<FavoriteListView> {
  List numberTruthList = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: Center(
                child: CustomText(
                  text: 'Favori Sorularım',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.purple[700]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: numberTruthList.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.black,
                    child: ListTile(
                      title: CustomText(
                        text: (i + 1).toString(),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      subtitle: const CustomText(
                        text: 'Soru İçeriği',
                        textStyle: TextStyle(fontSize: 13),
                      ),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
