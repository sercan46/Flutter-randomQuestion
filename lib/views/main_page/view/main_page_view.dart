import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/views/add_question/view/add_question_view.dart';
import 'package:random_question/views/favorite_list/view-model/favorite_list_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../products/widgets/app_bar/custom_appbar.dart';
import '../../../products/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../random_question/view-model/random_question_view_model.dart';
import '../../random_question/view/random_question_view.dart';
import '../view-model/main_page_view_model.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final FavoriteListViewModel _favoriteListViewModel = FavoriteListViewModel();
  @override
  void initState() {
    super.initState();
  }

  final MainPageViewModel _mainPageViewModel = MainPageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.main_page_header.locale,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.SETTING_PAGE);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            )
          ],
        ),
        floatingActionButton:
            Provider.of<MainPageViewModel>(context, listen: true)
                        .currentIndex ==
                    0
                ? buildFloatingAction(context)
                : Container(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
          index: Provider.of<MainPageViewModel>(context, listen: true)
              .currentIndex,
          children: const [
            RandomQuestionView(),
            AddQuestionView(),
          ],
        ),
        bottomNavigationBar: const CustomButtomNavigationBar());
  }

  Padding buildFloatingAction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 70,
        width: 70,
        child: Consumer<RandomQuestionViewModel>(
          builder: ((context, value, child) {
            return value.isLoading == false
                ? FloatingActionButton(
                    tooltip: 'Add Favorite',
                    elevation: 0,
                    onPressed: _favoriteListViewModel.refreshItems().indexWhere(
                                (element) =>
                                    context
                                        .read<RandomQuestionViewModel>()
                                        .randomQuestionModel!
                                        .text
                                        .toString() ==
                                    element['text']) ==
                            -1
                        ? () {
                            _mainPageViewModel.createItem({
                              "id": context
                                  .read<RandomQuestionViewModel>()
                                  .randomQuestionModel!
                                  .iV
                                  .toString(),
                              "text": context
                                  .read<RandomQuestionViewModel>()
                                  .randomQuestionModel!
                                  .text
                                  .toString()
                            }, context);
                            if (_favoriteListViewModel
                                    .refreshItems()
                                    .indexWhere((element) =>
                                        context
                                            .read<RandomQuestionViewModel>()
                                            .randomQuestionModel!
                                            .text
                                            .toString() ==
                                        element['text']) ==
                                -1) {
                              context
                                  .read<MainPageViewModel>()
                                  .isQuestionAddedOldest = false;
                            } else {
                              context
                                  .read<MainPageViewModel>()
                                  .isQuestionAddedOldest = true;
                            }
                          }
                        : null,
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
                      child: Consumer<MainPageViewModel>(
                        builder: (context, value, child) {
                          return value.isQuestionAddedOldest == false
                              ? const Icon(Icons.favorite,
                                  size: 40, color: Colors.white)
                              : const Icon(Icons.favorite,
                                  size: 40, color: Colors.grey);
                        },
                      ),
                    ),
                  )
                : Container();
          }),
        ),
      ),
    );
  }
}
