import 'package:flutter/material.dart';
import 'package:yukparkir/model/user_model.dart';

class DashboardProvider extends ChangeNotifier {
  UserModel userModel = globalUserModel;

  String getGreetings() {
    return 'Hai, ${userModel.username}!';
  }

}
