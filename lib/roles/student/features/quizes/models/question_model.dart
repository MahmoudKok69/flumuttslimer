// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionModel {
  String? id;
  String? quiz_id;
  String? label;
  String? answer;
  String? option1;
  String? option2;
  String? option3;
  QuestionModel({
    this.id,
    this.quiz_id,
    this.label,
    this.answer,
    this.option1,
    this.option2,
    this.option3,
  });

  QuestionModel copyWith({
    String? id,
    String? quiz_id,
    String? label,
    String? answer,
    String? option1,
    String? option2,
    String? option3,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      quiz_id: quiz_id ?? this.quiz_id,
      label: label ?? this.label,
      answer: answer ?? this.answer,
      option1: option1 ?? this.option1,
      option2: option2 ?? this.option2,
      option3: option3 ?? this.option3,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quiz_id': quiz_id,
      'label': label,
      'answer': answer,
      'option1': option1,
      'option2': option2,
      'option3': option3,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] != null ? map['id'] as String : null,
      quiz_id: map['quiz_id'] != null ? map['quiz_id'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      answer: map['answer'] != null ? map['answer'] as String : null,
      option1: map['option1'] != null ? map['option1'] as String : null,
      option2: map['option2'] != null ? map['option2'] as String : null,
      option3: map['option3'] != null ? map['option3'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionModel(id: $id, quiz_id: $quiz_id, label: $label, answer: $answer, option1: $option1, option2: $option2, option3: $option3)';
  }

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.quiz_id == quiz_id &&
        other.label == label &&
        other.answer == answer &&
        other.option1 == option1 &&
        other.option2 == option2 &&
        other.option3 == option3;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        quiz_id.hashCode ^
        label.hashCode ^
        answer.hashCode ^
        option1.hashCode ^
        option2.hashCode ^
        option3.hashCode;
  }
}
