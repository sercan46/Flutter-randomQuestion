class AddQuestionModel {
  String? text;

  AddQuestionModel({this.text});

  AddQuestionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}
