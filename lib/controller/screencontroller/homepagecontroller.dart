import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/mdel/postmodel.dart';
import 'package:flutter_application_2/mdel/usermodel.dart';
import 'package:flutter_application_2/view/screens/frindsrequist.dart';
import 'package:flutter_application_2/view/screens/home.dart';
import 'package:flutter_application_2/view/screens/market.dart';
import 'package:flutter_application_2/view/screens/notification.dart';
import 'package:flutter_application_2/view/screens/sitting.dart';
import 'package:flutter_application_2/view/screens/videos.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
  @override
  void onInit() async {
    await getuserdata();
    super.onInit();
  }

  List<Widget> pages = [
    LatestNews(),
    FrindsRequist(),
    Videos(),
    Market(),
    Notifications(),
    Sitting()
  ];
  UserModel? userModel;
  getuserdata() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userUid)
        .get()
        .then((value) {
      value.data();
      userModel = UserModel.fromjson(value.data()!);
      update();
      print(userModel!.email);
    }).catchError((e) {
      print(e.toString());
    });
  }
}
