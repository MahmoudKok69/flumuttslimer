// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyQuizModel {
  String? id;
  String? teacher_name;
  double? result;
  String? quiz_name;
  MyQuizModel({
    this.id,
    this.teacher_name,
    this.result,
    this.quiz_name,
  });

  MyQuizModel copyWith({
    String? id,
    String? teacher_name,
    double? result,
    String? quiz_name,
  }) {
    return MyQuizModel(
      id: id ?? this.id,
      teacher_name: teacher_name ?? this.teacher_name,
      result: result ?? this.result,
      quiz_name: quiz_name ?? this.quiz_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'teacher_name': teacher_name,
      'result': result,
      'quiz_name': quiz_name,
    };
  }

  factory MyQuizModel.fromMap(Map<String, dynamic> map) {
    return MyQuizModel(
      id: map['id'] != null ? map['id'] as String : null,
      teacher_name:
          map['teacher_name'] != null ? map['teacher_name'] as String : null,
      result: map['result'] != null ? map['result'] as double : null,
      quiz_name: map['quiz_name'] != null ? map['quiz_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyQuizModel.fromJson(String source) =>
      MyQuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyQuizModel(id: $id, teacher_name: $teacher_name, result: $result, quiz_name: $quiz_name)';
  }

  @override
  bool operator ==(covariant MyQuizModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.teacher_name == teacher_name &&
        other.result == result &&
        other.quiz_name == quiz_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        teacher_name.hashCode ^
        result.hashCode ^
        quiz_name.hashCode;
  }
}
