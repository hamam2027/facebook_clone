import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/mdel/usermodel.dart';
import 'package:flutter_application_2/shared/cashhelper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  loginuser({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
    });
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userinfo = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      userUid = value.user!.uid;
      await Cashhelper.saveData(key: "userUid", value: value.user!.uid);
      update();
      await creatuser(
          name: value.user!.email!,
          email: value.user!.email!,
          uid: value.user!.uid);

      return value;
    });
    print(userinfo.user!.uid);

    // Once signed in, return the UserCredential
  }

  creatuser({
    required String name,
    required String email,
    required String uid,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      uId: uid,
      image:
          'https://img.freepik.com/free-photo/young-man-student-with-notebooks-showing-thumb-up-approval-smiling-satisfied-blue-studio-background_1258-65597.jpg?w=740&t=st=1673919918~exp=1673920518~hmac=d79b5f8e3af165240f3080a3169a3a6171aea7ffef9f48df317be57feeabc99d',
      bio: "write your bio here",
      coverimage:
          "https://img.freepik.com/free-vector/purple-luxury-background-with-silver-line-decoration-glitter-light-effect_91128-2081.jpg?size=626&ext=jpg&ga=GA1.1.907940663.1673707219&semt=sph",
    );
    FirebaseFirestore.instance.collection("users").doc(uid).set(model.toMap());
  }
}
