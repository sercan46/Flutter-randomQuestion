import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/views/main_page/view-model/main_page_view_model.dart';
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
    return Consumer<MainPageViewModel>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          items: _list,
          currentIndex: value.currentIndex,
          onTap: (int index) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Provider.of<MainPageViewModel>(context, listen: false)
                .currentIndex = index;
          },
        );
      },
    );
  }
}
