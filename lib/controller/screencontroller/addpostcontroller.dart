import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/mdel/postmodel.dart';
import 'package:flutter_application_2/mdel/usermodel.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  Color color = Colors.white;
  Color iconpost = Colors.grey;
  List<Color> colors = [
    Colors.white,
    Colors.teal,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.pink,
    Colors.redAccent,
    Colors.purple,
    Colors.brown,
    Colors.lime,
    Colors.indigo,
  ];
  changcolor(int index) {
    color = colors[index];
    update();
  }

  changiconpost(String val) {
    if (val.isNotEmpty) {
      iconpost = Colors.blue;
      update();
    } else {
      iconpost = Colors.grey;
      update();
    }
  }

  // create post and uploude image.

  ImagePicker picker = ImagePicker();

  File? postimage;

  Future<void> getpostimage() async {
    XFile? postimag = await picker.pickImage(source: ImageSource.camera);
    if (postimag != null) {
      postimage = File(postimag.path);

      update();
    } else {
      update();
    }
  }

  // Future<void> uploadepostimage({
  //   required String text,
  //   required String datetime,
  // }) async {
  //   // adpost = true;
  //   update();
  //   FirebaseStorage.instance
  //       .ref()
  //       .child("posts/ ${Uri.file(postimage!.path).pathSegments.last}")
  //       .putFile(postimage!)
  //       .then((val) {
  //     val.ref.getDownloadURL().then((value) {
  //       print(value);
  //       createpost(
  //         text: text,
  //         datetime: datetime,
  //         postimage: value,
  //       );

  //       update();
  //     }).catchError((e) {
  //       update();
  //     });
  //   }).catchError((e) {
  //     update();
  //   });
  // }

  // UserModel? userModel;
  // PostsModel? postModel;
  // Future<void> createpost({
  //   required String text,
  //   required String datetime,
  //   String? postimage,
  //   bool userlike = false,
  // }) async {
  //   // if (adpost == false) {
  //   //   adpost = true;
  //   // }
  //   // update();
  //   postModel = PostsModel(
  //     name: userModel!.name!,
  //     uId: userModel!.uId!,
  //     image: userModel!.image!,
  //     datetime: datetime,
  //     text: text,
  //     postimage: postimage ?? "",
  //   );
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .add(postModel!.toMap())
  //       .then((value) async {
  //     print(value.id);
  //     update();
  //     // adpost = false;
  //     // // posts = [];
  //     // // getpostsData();
  //   }).catchError((error) {});
  //   update();
  // }

  File? video;

  Future<void> getpostvideo() async {
    XFile? videos = await picker.pickVideo(source: ImageSource.camera);
    if (videos != null) {
      video = File(videos.path);

      update();
    } else {
      update();
    }
  }
}
