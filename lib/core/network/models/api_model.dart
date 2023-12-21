// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ApiResponseModel {
  String? message;
  String? status_code;
  Map<String, dynamic>? data;
  ApiResponseModel({
    this.message,
    this.status_code,
    this.data,
  });

  ApiResponseModel copyWith({
    String? message,
    String? status_code,
    Map<String, dynamic>? data,
  }) {
    return ApiResponseModel(
      message: message ?? this.message,
      status_code: status_code ?? this.status_code,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status_code': status_code,
      'data': data,
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      message: map['message'] != null ? map['message'] as String : null,
      status_code:
          map['status_code'] != null ? map['status_code'] as String : null,
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiResponseModel(message: $message, status_code: $status_code, data: $data)';

  @override
  bool operator ==(covariant ApiResponseModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status_code == status_code &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode => message.hashCode ^ status_code.hashCode ^ data.hashCode;
}
