import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/intro/introScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => InteroScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppComponent.White,
      body: Center(
          child: Image(
        image: AssetImage(AppComponent.introLogo),
        height: 120.sp,
      )),
    );
  }
}
