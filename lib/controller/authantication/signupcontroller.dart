import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/mdel/usermodel.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  usersignup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      userUid = value.user!.uid;
      print(userUid);
      await creatuser(
          name: name,
          phone: phone,
          email: email,
          uid: value.user!.uid,
          password: password,
          isemailverified: value.user!.emailVerified);
      userUid = value.user!.uid;
    });
  }

  creatuser({
    required String name,
    required String phone,
    required String email,
    required String uid,
    required String password,
    required bool isemailverified,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uid,
      password: password,
      image:
          'https://img.freepik.com/free-photo/young-man-student-with-notebooks-showing-thumb-up-approval-smiling-satisfied-blue-studio-background_1258-65597.jpg?w=740&t=st=1673919918~exp=1673920518~hmac=d79b5f8e3af165240f3080a3169a3a6171aea7ffef9f48df317be57feeabc99d',
      bio: "write your bio here",
      coverimage:
          "https://images.template.net/wp-content/uploads/2014/11/Natural-Facebook-Cover-Photo.jpg",
      isemailverified: isemailverified,
    );

    FirebaseFirestore.instance.collection("users").doc(uid).set(model.toMap());
  }
}
