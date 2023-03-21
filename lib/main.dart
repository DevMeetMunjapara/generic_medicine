import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/howToProcess.dart';
import 'package:generic_medicine/castomWidget/locationAdd.dart';
import 'package:generic_medicine/castomWidget/process.dart';
import 'package:generic_medicine/castomWidget/profile.dart';
import 'package:generic_medicine/castomWidget/saveInfo.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/intro/introScreen.dart';
import 'package:generic_medicine/intro/logo.dart';
import 'package:generic_medicine/intro/permission.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:generic_medicine/login/otp.dart';
import 'package:generic_medicine/login/singUp.dart';
import 'package:generic_medicine/uploadPrescription.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
            "/": (context) => SingUp(),
            AppComponent.loginPage: (context) => Login(),
            AppComponent.singUpPage: (context) => SingUp(),
          },
        );
      },
    );
  }
}
