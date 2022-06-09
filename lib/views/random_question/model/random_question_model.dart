class RandomQuestionModel {
  String? sId;
  String? text;
  bool? isApproved;
  int? iV;

  RandomQuestionModel({this.sId, this.text, this.isApproved, this.iV});

  RandomQuestionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    isApproved = json['isApproved'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['text'] = text;
    data['isApproved'] = isApproved;
    data['__v'] = iV;
    return data;
  }
}
