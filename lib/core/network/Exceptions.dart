// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoInternetExceptions implements Exception {
  String? message;
  NoInternetExceptions({
    this.message,
  });
}

class ServerFaildException implements Exception {
  String? message;
  ServerFaildException({
    this.message,
  });
}
