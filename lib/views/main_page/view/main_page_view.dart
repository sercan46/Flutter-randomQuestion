import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/views/add_question/view/add_question_view.dart';
import '../../../products/widgets/app_bar/custom_appbar.dart';
import '../../../products/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../random_question/view-model/random_question_view_model.dart';
import '../../random_question/view/random_question_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton:
            Provider.of<RandomQuestionViewModel>(context, listen: true)
                        .currentIndex ==
                    0
                ? buildFloatingAction()
                : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: Provider.of<RandomQuestionViewModel>(context, listen: true)
              .currentIndex,
          children: const [
            RandomQuestionView(),
            AddQuestionView(),
          ],
        ),
        bottomNavigationBar: const CustomButtomNavigationBar());
  }

  Padding buildFloatingAction() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
