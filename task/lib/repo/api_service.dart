import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task/model/dog_model.dart';
import 'package:task/model/user_model.dart';

import '../model/api_status.dart';
import '../utils.dart';
class UserServices {
  static Future<Object> getUsers(String api,{bool user=false}) async {
    try {
      var response = await http.get(Uri.parse(api));
      print("-=-=-=---->${response.body}");
      if (SUCCESS == response.statusCode) {
        if(user){
          return Success(response: userModelFromJson(response.body));
        }
        return Success(response: dogModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE,
          errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET,
          errorResponse: 'No Internet          Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET,
          errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: INVALID_FORMAT,
          errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(
          code: UNKNOWN_ERROR,
          errorResponse: 'Unknown Error');
    }
  }}