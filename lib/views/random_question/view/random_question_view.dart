import 'package:flutter/material.dart';
import 'package:random_question/core/extension/helpers.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';
import '../../../products/widgets/app_bar/custom_appbar.dart';
import '../../../products/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class RandomQuestionView extends StatefulWidget {
  @override
  _RandomQuestionViewState createState() => _RandomQuestionViewState();
}

class _RandomQuestionViewState extends State<RandomQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: buildFloatingAction(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: CustomText(text: 'Sizin İçin Seçtiğimiz Soru')),
                const Center(
                    child: CustomText(text: 'Sizin İçin Seçtiğimiz Soru')),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.purple[700],
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Yeni Soru'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomButtomNavigationBar());
  }

  Padding buildFloatingAction() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, size: 40),
          ),
        ),
      ),
    );
  }
}
