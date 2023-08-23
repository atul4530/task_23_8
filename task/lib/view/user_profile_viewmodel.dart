import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/model/dog_model.dart';
import 'package:task/model/user_model.dart';

import '../model/api_error.dart';
import '../model/api_status.dart';
import '../repo/api_service.dart';

class UserProfileViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  UserModel mainUser = UserModel();

  UserError? _userError;
  bool get loading => _loading;
  UserError get userError => _userError!;



  UserProfileViewModel() {
    getusers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getusers() async {
    setLoading(true);
    var response = await UserServices.getUsers("https://randomuser.me/api/",user: true);
    if (response is Success) {
      mainUser =response.response as UserModel;
      notifyListeners();
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
    notifyListeners();
  }
}