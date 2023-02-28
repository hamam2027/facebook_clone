import 'dart:convert';

import 'package:flutter_application_2/mdel/usersmodel.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class FriendsRequistController extends GetxController {
  @override
  void onInit() async {
    await getusers();

    super.onInit();
  }

  UsersModel? user;

  getusers() async {
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/users"));
    Map<String, dynamic> data = jsonDecode(response.body);

    user = UsersModel.fromJson(data);
    print(user!.users![0].firstName);
    update();
  }
}
