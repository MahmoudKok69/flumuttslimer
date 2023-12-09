// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';

class AddQuizModel {
  String? name_quiz;
  String? question;
  dynamic correctAnswer;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  AddQuizModel({
    this.name_quiz,
    this.question,
    this.correctAnswer,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
  });
  Map<String, dynamic> toJson() {
    return {
      'name_quiz': name_quiz,
      'question': question,
      'correctAnswer': correctAnswer,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
    };
  }
}
