import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTP extends StatefulWidget {
  final String vereficationId;
  final bool isSingUp;
  String? name;
  String? email;
  String? number;

  OTP({
    super.key,
    required this.vereficationId,
    required this.isSingUp,
    this.email,
    this.name,
    this.number,
  });

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpConttrolor = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
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
                  SvgPicture.asset(
                    AppComponent.logo,
                    height: 70.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 290.h,
                      child: SvgPicture.asset(
                        AppComponent.singUp,
                        fit: BoxFit.fill,
                      )),
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
                      controller: otpConttrolor,
                      length: 6,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    FullButton(
                        title: "Verified your OTP",
                        loading: loading,
                        onPressed: () async {
                          if (otpConttrolor.text.length < 6) {
                            print("-------Not");
                          }
                          setState(() {
                            loading = true;
                          });
                          final crendital = PhoneAuthProvider.credential(
                              verificationId: widget.vereficationId,
                              smsCode: otpConttrolor.text);
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(crendital);

                            if (widget.isSingUp == true) {
                              FirebaseFirestore.instance
                                  .collection("allUser")
                                  .doc("+91${widget.number}")
                                  .set({
                                "name": widget.name,
                                "email": widget.email,
                                "number": widget.number,
                              });
                            }

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UploadPrescription()),
                                (route) => false);
                          } catch (e) {
                            print("---------$e");
                            setState(() {
                              loading = false;
                            });
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        mycolors: AppComponent.Green),
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
      ),
    );
  }
}
