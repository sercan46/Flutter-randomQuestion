import 'package:dio/dio.dart';
import 'package:random_question/views/random_question/model/random_question_model.dart';

abstract class IRandomQuestionService {
  final Dio dio;
  IRandomQuestionService(this.dio);

  final String randomPath = IRandomQuestionPath.RANDOM_QUESTION.rawValue;
  Future<RandomQuestionModel> getRandomQuestion();
}

enum IRandomQuestionPath { RANDOM_QUESTION }

extension IRandomQuestionServicePathExtension on IRandomQuestionPath {
  String get rawValue {
    switch (this) {
      case IRandomQuestionPath.RANDOM_QUESTION:
        return 'getRandomQuestion';
    }
  }
}
