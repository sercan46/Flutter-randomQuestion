import 'package:dio/dio.dart';
import 'package:random_question/views/add_question/model/add_question_model.dart';

import '../../random_question/model/random_question_model.dart';

abstract class IAddQuestionService {
  final Dio dio;
  IAddQuestionService(this.dio);

  final String addPath = IAddQuestionPath.ADD_QUESTION.rawValue;
  Future<RandomQuestionModel> postNewQuestion(AddQuestionModel model);
}

enum IAddQuestionPath { ADD_QUESTION }

extension IRandomQuestionServicePathExtension on IAddQuestionPath {
  String get rawValue {
    switch (this) {
      case IAddQuestionPath.ADD_QUESTION:
        return 'addQuestion';
    }
  }
}
