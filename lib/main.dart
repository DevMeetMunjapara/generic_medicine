import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/process.dart';
import 'package:generic_medicine/intro/introScreen.dart';
import 'package:generic_medicine/intro/logo.dart';
import 'package:generic_medicine/intro/permission.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:generic_medicine/login/otp.dart';
import 'package:generic_medicine/login/singUp.dart';
import 'package:generic_medicine/uploadPrescription.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // var w = MediaQuery.of(context).size.width;
      // var h = MediaQuery.of(context).size.height;
      // print("-------$w");
      // print("-------$h");
      designSize: Size(430, 960),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            scaffoldBackgroundColor: AppComponent.White,
            fontFamily: "DMSans",
          ),
          routes: {
            "/": (context) => Process(),
          },
        );
      },
    );
  }
}
