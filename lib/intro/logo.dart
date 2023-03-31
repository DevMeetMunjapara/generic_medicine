import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/intro/introScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerScreen();
  }

  timerScreen() async {
    await Future.delayed(Duration(seconds: 2), () async {
      final perf = await SharedPreferences.getInstance();
      final showHome = perf.getBool("showHome") ?? false;
      print("-------$showHome");
      // final _auth = FirebaseAuth.instance;
      // final user = _auth.currentUser;
      if (showHome == true) {
        final _auth = FirebaseAuth.instance;
        final user = _auth.currentUser;
        var loginMobileNumber = user?.phoneNumber;
        if (user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UploadPrescription()));
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => InteroScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppComponent.White,
      body: Center(
          child: SvgPicture.asset(
        AppComponent.introLogo,
        width: 180.sp,
      )),
    );
  }
}
