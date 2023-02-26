import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/componant/constant.dart';
import 'package:flutter_application_2/shared/cashhelper.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/view/auth/signup.dart';
import 'package:flutter_application_2/view/screens/market.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Cashhelper.init();

  userUid = await Cashhelper.getdata(key: "userUid");
  print(userUid);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userUid != null ? HomePage() : SignUp(),

      //
    );
  }
}
