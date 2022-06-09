import 'dart:io';

import 'package:dio/dio.dart';
import 'package:random_question/views/random_question/model/random_question_model.dart';
import 'package:random_question/views/random_question/service/IRandomQuestionService.dart';

class RandomQuestionService extends IRandomQuestionService {
  RandomQuestionService(Dio dio) : super(dio);

  @override
  Future<RandomQuestionModel> getRandomQuestion() async {
    final response = await dio.get(randomPath);
    if (response.statusCode == HttpStatus.ok) {
      return RandomQuestionModel.fromJson(response.data);
    } else {
      return Future.error(response.data);
    }
  }
}
