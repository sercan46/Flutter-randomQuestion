import 'dart:io';

import 'package:dio/dio.dart';
import 'package:random_question/views/add_question/model/add_question_model.dart';
import 'package:random_question/views/add_question/service/IAddQuestionService.dart';
import 'package:random_question/views/random_question/model/random_question_model.dart';

class AddQuestionService extends IAddQuestionService {
  AddQuestionService(Dio dio) : super(dio);

  @override
  Future<RandomQuestionModel> postNewQuestion(AddQuestionModel model) async {
    final response = await dio.post(addPath, data: model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return RandomQuestionModel.fromJson(response.data);
    } else {
      return Future.error(response.data);
    }
  }
}
