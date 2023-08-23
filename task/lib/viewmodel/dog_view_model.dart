import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/model/dog_model.dart';

import '../model/api_error.dart';
import '../model/api_status.dart';
import '../repo/api_service.dart';

class DogViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  DogModel mainDog = DogModel();

  UserError? _userError;
  bool get loading => _loading;
  UserError get userError => _userError!;



  DogViewModel() {
    getDogImage();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getDogImage() async {
    setLoading(true);
    var response = await UserServices.getUsers("https://dog.ceo/api/breeds/image/random");
    if (response is Success) {
      mainDog =response.response as DogModel;
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