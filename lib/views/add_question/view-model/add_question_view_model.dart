import 'package:flutter/cupertino.dart';
import 'package:random_question/views/add_question/model/add_question_model.dart';
import 'package:random_question/views/add_question/service/IAddQuestionService.dart';

import '../../random_question/model/random_question_model.dart';

class AddQuestionViewModel extends ChangeNotifier {
  final IAddQuestionService service;
  AddQuestionViewModel({required this.service});
  Future<RandomQuestionModel?> addQuestion(String text) async {
    final data =
        await service.postNewQuestion((AddQuestionModel(text: text.trim())));
    if (data is RandomQuestionModel) {
      return data;
    } else {
      return null;
    }
  }
}
