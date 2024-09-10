import 'dart:io';

class ApiException extends HttpException {
  int code;
  String message;

  ApiException(this.code, this.message) : super(message);

//convert map to object
  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(json['statusCode'], json['statusMessage']);
  }
}
