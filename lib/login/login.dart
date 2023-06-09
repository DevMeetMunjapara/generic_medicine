import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/login/otp.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  bool sendOTP = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(children: [
              Container(
                color: AppComponent.White,
                height: 500.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SvgPicture.asset(
                      AppComponent.logo,
                      height: 60.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                      child: SizedBox(
                          child: SvgPicture.asset(
                        AppComponent.login,
                        height: 400,
                        fit: BoxFit.cover,
                      )),
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
                        "Login",
                        style: TextStyle(
                            fontSize: 30.h,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                                fontSize: 22.h,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppComponent.singUpPage);
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 22.h,
                                  color: AppComponent.Green,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Form(
                          key: _form,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: mobileNumber,
                            cursorColor: AppComponent.Green,
                            style: TextStyle(fontSize: 18.sp),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20.sp),
                                prefixIcon: Container(
                                  // color: Colors.amber,
                                  width: 10.w,
                                  child: Center(
                                    child: Text(
                                      "+91",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                hintText: "Enter 10 digit mobile number",
                                hintStyle: TextStyle(fontSize: 16.sp),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 235, 235, 235))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide:
                                        BorderSide(color: AppComponent.Green))),
                            validator: (value) {
                              if (value == "") {
                                return "Enter Mobile Number";
                              }
                              if (value!.length != 10) {
                                return 'Only 10 digit number valid';
                              }
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      FullButton(
                        title: "Get verification code",
                        loading: loading,
                        onPressed: () async {
                          bool result =
                              await InternetConnectionChecker().hasConnection;
                          if (result == true) {
                            print('---------YAY! Free cute dog pics!');
                            if (_form.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              var allUser = await FirebaseFirestore.instance
                                  .collection("allUser")
                                  .doc("${"+91" + mobileNumber.text}")
                                  .get();
                              if (allUser.exists) {
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: "${"+91" + mobileNumber.text}",
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OTP(
                                                  vereficationId:
                                                      verificationId,
                                                  isSingUp: false,
                                                )));
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {},
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Container(
                                          padding: EdgeInsets.all(16.sp),
                                          height: 70.h,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              "Please SingUp or Registration Now",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp),
                                            ),
                                          ),
                                        )));
                                print("SingUp Now");
                                Timer(Duration(milliseconds: 500), () {
                                  setState(() {
                                    loading = false;
                                  });
                                });
                              }
                            }

                            Timer(Duration(seconds: 2), () {
                              setState(() {
                                loading = false;
                              });
                            });
                          } else {
                            // ignore: use_build_context_synchronously
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ShowInternetBox();
                                });

                            print('----------No internet :( Reason:');
                            setState(() {
                              loading = false;
                            });
                          }
                        },
                        mycolors: AppComponent.Green,
                      ),
                      SizedBox(
                        height: 20.h,
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
      ),
    );
  }
}
