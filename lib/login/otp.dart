import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            color: AppComponent.White,
            height: 400.h,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  AppComponent.logo,
                  height: 80.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            AppComponent.otp,
                          ))),
                  height: 280.h,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.h, 30.h, 30.h, 10.h),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verification Code",
                    style: TextStyle(
                        fontSize: 30.h,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "We have sent the code verification\nto your Mobile Number",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 20.h,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Pinput(
                    length: 6,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  FullButton(title: "Verified your OTP", onPressed: () {}),
                  SizedBox(
                    height: 130.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "By signing in you agree to our",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Color.fromARGB(255, 126, 126, 126)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "terms & conditions ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppComponent.NevyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "and ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Color.fromARGB(255, 126, 126, 126)),
                      ),
                      Text(
                        "Privacy policy",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppComponent.NevyBlue,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
