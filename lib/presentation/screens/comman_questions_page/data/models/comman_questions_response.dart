class CommanQuestionsResponseBody {
  List<CommanQuestions>? commanQuestions;

  CommanQuestionsResponseBody({this.commanQuestions});

  CommanQuestionsResponseBody.fromJson(Map<String, dynamic> json) {
    if (json['comman_questions'] != null) {
      commanQuestions = <CommanQuestions>[];
      json['comman_questions'].forEach((v) {
        commanQuestions!.add(new CommanQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commanQuestions != null) {
      data['comman_questions'] =
          this.commanQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommanQuestions {
  String? question;
  String? answer;

  CommanQuestions({this.question, this.answer});

  CommanQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}