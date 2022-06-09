import 'package:flutter/material.dart';
import 'package:random_question/views/random_question/model/random_question_model.dart';
import 'package:random_question/views/random_question/service/IRandomQuestionService.dart';

class RandomQuestionViewModel extends ChangeNotifier {
  final IRandomQuestionService service;
  RandomQuestionViewModel({required this.service});
  String _randomQuestion = '';
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  RandomQuestionModel? _randomQuestionModel;

  RandomQuestionModel? get randomQuestionModel => _randomQuestionModel;

  set randomQuestionModel(RandomQuestionModel? randomQuestionModel) {
    _randomQuestionModel = randomQuestionModel;
  }

  String get randomQuestion => _randomQuestion;

  set randomQuestion(String randomQuestion) {
    _randomQuestion = randomQuestion;
    notifyListeners();
  }

  Future<RandomQuestionModel?> getRandomQuestion() async {
    final data = await service.getRandomQuestion();
    if (data is RandomQuestionModel) {
      return data;
    } else {
      return null;
    }
  }
}
