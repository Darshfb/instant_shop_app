class fqamodel{
  String? answer;
  String? question;

  fqamodel({
    this.answer,
    this.question,
  });

  Map<String, dynamic> toMap() {
    return {
      'answer': this.answer,
      'question': this.question,
    };
  }

  factory fqamodel.fromMap(Map<String, dynamic> map) {
    return fqamodel(
      answer: map['answer'] as String,
      question: map['question'] as String,
    );
  }
}