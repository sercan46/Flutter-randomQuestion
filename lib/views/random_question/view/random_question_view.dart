import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/core/init/network/network_manager.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';
import 'package:random_question/views/random_question/service/random_question_service.dart';
import 'package:random_question/views/random_question/view-model/random_question_view_model.dart';
import '../../favorite_list/view-model/favorite_list_view_model.dart';
import '../../main_page/view-model/main_page_view_model.dart';

class RandomQuestionView extends StatefulWidget {
  const RandomQuestionView({Key? key}) : super(key: key);
  @override
  _RandomQuestionViewState createState() => _RandomQuestionViewState();
}

class _RandomQuestionViewState extends State<RandomQuestionView> {
  final RandomQuestionViewModel _randomQuestionViewModel =
      RandomQuestionViewModel(
    service: RandomQuestionService(NetworkManager.instance.networkManager),
  );
  final FavoriteListViewModel _favoriteListViewModel = FavoriteListViewModel();

  @override
  void initState() {
    super.initState();
    _randomQuestionViewModel.getRandomQuestion().then((value) {
      context.read<RandomQuestionViewModel>().randomQuestionModel = value;
      context.read<RandomQuestionViewModel>().isLoading = false;
      context.read<RandomQuestionViewModel>().randomQuestion =
          value?.text ?? '';
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const Center(
                      child: Icon(
                    Icons.question_mark_sharp,
                    size: 50,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CustomText(
                      text: LocaleKeys.random_question_chosen_for_you.locale,
                    ),
                  )
                ],
              ),
              Center(
                child: Consumer<RandomQuestionViewModel>(
                  builder: (context, value, child) {
                    return value.isLoading == false
                        ? CustomText(
                            text: value.randomQuestion,
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 123, 31, 162),
                                fontWeight: FontWeight.w800),
                          )
                        : CircularProgressIndicator(
                            color: Colors.purple[700],
                          );
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustomText(
                    text: LocaleKeys.random_question_info.locale,
                    textStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.purple[700],
                    ),
                  ),
                  onPressed: () {
                    context.read<RandomQuestionViewModel>().isLoading = true;

                    _randomQuestionViewModel.getRandomQuestion().then((value) {
                      context
                          .read<RandomQuestionViewModel>()
                          .randomQuestionModel = value;
                      context.read<RandomQuestionViewModel>().isLoading = false;

                      context.read<RandomQuestionViewModel>().randomQuestion =
                          value?.text ?? '';
                      if (_favoriteListViewModel.refreshItems().indexWhere(
                              (element) => value?.text == element['text']) ==
                          -1) {
                        context
                            .read<MainPageViewModel>()
                            .isQuestionAddedOldest = false;
                      } else {
                        context
                            .read<MainPageViewModel>()
                            .isQuestionAddedOldest = true;
                      }
                    }).catchError((onError) {
                      print(onError);
                    });
                  },
                  child: CustomText(
                      text: LocaleKeys.random_question_add_new_question.locale),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
