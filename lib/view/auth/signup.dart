import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/componant/componant.dart';
import 'package:flutter_application_2/controller/authantication/signupcontroller.dart';
import 'package:flutter_application_2/view/auth/signin.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  SignUpController controller = Get.put(SignUpController());

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

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
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [Colors.green, Colors.red])),
                  transform: Matrix4.rotationZ(-3 * pi / 180)..translate(-10.0),
                  child: const Text(
                    "AKKAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.transparent],
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myform(
                          prifixicon: Icons.person,
                          valid: (String val) {
                            if (val.isEmpty) {
                              return "gfhfhmlgf";
                            } else {
                              return null;
                            }
                          },
                          controller: usernamecontroller,
                          labltext: 'User Name',
                          ubs: false,
                          typ: TextInputType.text),
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
                          sufixfun: () {
                            print("object");
                          },
                          icon: Icons.visibility_off,
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
                      myform(
                          valid: (String val) {
                            if (val.isEmpty) {
                              return "gfhfhmlgf";
                            } else {
                              return null;
                            }
                          },
                          controller: phonecontroller,
                          labltext: 'phone',
                          ubs: false,
                          typ: TextInputType.number),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                height: devicesize.height * .06,
                minWidth: devicesize.width * .70,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  controller.usersignup(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                      name: usernamecontroller.text,
                      phone: phonecontroller.text);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignIn());
                  },
                  child: const Text(
                    "if you have account click here",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ],
    ));
    //   },
    // );
  }
}
