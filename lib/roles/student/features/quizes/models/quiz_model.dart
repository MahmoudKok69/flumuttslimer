// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flumuttslimer/roles/student/features/quizes/models/question_model.dart';

class QuizModel {
  String? id;
  String? teacher_id;
  String? teacher_name;
  double? points;
  String? title;
  List<QuestionModel>? questions;
  QuizModel({
    this.id,
    this.teacher_id,
    this.teacher_name,
    this.points,
    this.title,
    this.questions,
  });

  QuizModel copyWith({
    String? id,
    String? teacher_id,
    String? teacher_name,
    double? points,
    String? title,
    List<QuestionModel>? questions,
  }) {
    return QuizModel(
      id: id ?? this.id,
      teacher_id: teacher_id ?? this.teacher_id,
      teacher_name: teacher_name ?? this.teacher_name,
      points: points ?? this.points,
      title: title ?? this.title,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'teacher_id': teacher_id,
      'teacher_name': teacher_name,
      'points': points,
      'title': title,
      'questions': questions!.map((x) => x?.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] != null ? map['id'] as String : null,
      teacher_id:
          map['teacher_id'] != null ? map['teacher_id'] as String : null,
      teacher_name:
          map['teacher_name'] != null ? map['teacher_name'] as String : null,
      points: map['points'] != null ? map['points'] as double : null,
      title: map['title'] != null ? map['title'] as String : null,
      questions: map['questions'] != null
          ? List<QuestionModel>.from(
              (map['questions'] as List<int>).map<QuestionModel?>(
                (x) => QuestionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizModel(id: $id, teacher_id: $teacher_id, teacher_name: $teacher_name, points: $points, title: $title, questions: $questions)';
  }

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.teacher_id == teacher_id &&
        other.teacher_name == teacher_name &&
        other.points == points &&
        other.title == title &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        teacher_id.hashCode ^
        teacher_name.hashCode ^
        points.hashCode ^
        title.hashCode ^
        questions.hashCode;
  }
}
