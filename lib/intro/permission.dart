import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Permission extends StatefulWidget {
  const Permission({super.key});

  @override
  State<Permission> createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myappWithTitel(context, "App permissions"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25.h, right: 25.h, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 203, 234, 221),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Terms of service and privacy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Color.fromARGB(255, 8, 97, 92)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "We understand the nature and sensitivity of this topic and have taken strong measures to ensure that your data is not compromised.",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 57, 149, 113)),
                      )
                    ],
                  ),
                ),
                CustomText("Location",
                    "It is recommended that you set your location sharing 'Always' as it helps us to show you location specific data like availability of products. You can change this anytime later."),
                CustomText("Camera",
                    "To allow you to take a photo of prescriptions & directly upload it to the app."),
                CustomText("Photos/Media/Files",
                    "Media access permission is needed to store and retrieve your uploads such as prescription uploads on your device."),
                CustomText("SMS",
                    "To support automatic OTP confirmation, so that you don't have to enter the authentication code manually."),
                CustomText("Receive SMS",
                    "This helps us to send you payment related SMS by our payment partner."),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
            padding: EdgeInsets.only(bottom: 30.h),
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(20.h, 15.h, 20.h, 10.h),
                child: FullButton(
                    title: "Agree and Continue",
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      final bool showHome;

                      showHome = prefs.getBool('showHome') ?? false;
                      print("---------$showHome");

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                    },
                    mycolors: AppComponent.Green))),
      ),
    );
  }

  Widget CustomText(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppComponent.NevyBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
        Text(
          description,
          //textAlign: TextAlign.justify,
          style: TextStyle(
              color: Color.fromARGB(255, 126, 126, 126), fontSize: 14.sp),
        )
      ],
    );
  }
}
