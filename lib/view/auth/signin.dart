import 'package:flutter/material.dart';
import 'package:flutter_application_2/componant/componant.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/controller/authantication/signincontroller.dart';
import 'package:flutter_application_2/controller/authantication/signupcontroller.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/view/auth/signup.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  SignInController controller = Get.put(SignInController());

  late String email;

  late String password;

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size devicesize = MediaQuery.of(context).size;
    // return GetBuilder<SignInController>(
    //   builder: (GetxController controller) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/auth.jpg",
          height: devicesize.height,
          width: devicesize.width,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.white, Colors.transparent],
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myform(
                        valid: (String val) {
                          if (val.isEmpty) {
                            return "gfhfhmlgf";
                          } else {
                            return null;
                          }
                        },
                        controller: emailcontroller,
                        labltext: 'Email',
                        ubs: false,
                        typ: TextInputType.emailAddress),
                    myform(
                        icon: Icons.visibility_off,
                        sufixfun: () {},
                        valid: (String val) {
                          if (val.isEmpty) {
                            return "gfhfhmlgf";
                          } else {
                            return null;
                          }
                        },
                        controller: passwordcontroller,
                        labltext: 'Password',
                        ubs: true,
                        typ: TextInputType.visiblePassword),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  email = emailcontroller.text;
                  password = passwordcontroller.text;
                  controller.loginuser(email: email, password: password);
                  Get.to(() => HomePage());
                }
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                await controller.signInWithGoogle();
                if (userUid != " ") {
                  Get.to(() => HomePage());
                } else {
                  return null;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "login with google",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => SignUp());
                },
                child: const Text("if you havnt account click here",
                    style: TextStyle(color: Colors.black)))
          ],
        ),
      ],
    ));
    //   },
    // );
  }
}
