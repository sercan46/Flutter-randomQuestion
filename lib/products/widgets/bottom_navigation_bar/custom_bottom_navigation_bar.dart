import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/views/random_question/view-model/random_question_view_model.dart';
import '../../../core/extension/helpers.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomButtomNavigationBarState createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  final List<BottomNavigationBarItem> _list = Helpers.items;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<RandomQuestionViewModel>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          items: _list,
          currentIndex: value.currentIndex,
          onTap: (int index) {
            Provider.of<RandomQuestionViewModel>(context, listen: false)
                .currentIndex = index;
          },
        );
      },
    );
  }
}
