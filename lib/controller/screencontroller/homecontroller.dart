import 'dart:convert';

import 'package:flutter_application_2/controller/screencontroller/frindsrequistcontroller.dart';
import 'package:flutter_application_2/mdel/postmodel.dart';
import 'package:flutter_application_2/mdel/usersmodel.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  FriendsRequistController friendsRequistController =
      FriendsRequistController();

  PostsModel? postsModel;
  getposts() async {
    http.Response response = await http
        .get(Uri.parse("https://dummyjson.com/posts?skip=50&limit=100"));
    Map<String, dynamic> data = jsonDecode(response.body);
    postsModel = PostsModel.fromJson(data);
    print(postsModel!.posts![0].body);
    update();
  }

  UsersModel? user;

  getusersdetails() async {
    http.Response response = await http
        .get(Uri.parse("https://dummyjson.com/users?skip=0&limit=100"));
    Map<String, dynamic> data = jsonDecode(response.body);

    user = UsersModel.fromJson(data);
    print(user!.users![0].firstName);
    await getposts();
    print("hamam=========================");
    update();
  }
}
