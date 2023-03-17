import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            color: AppComponent.White,
            height: 500.h,
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
                            AppComponent.login,
                          ))),
                  height: 380.h,
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
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 22.h,
                            color: AppComponent.Green,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                      child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: AppComponent.Green,
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          //color: Colors.amber,
                          width: 10.h,
                          child: Center(
                            child: Text(
                              "+91",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        hintText: "Enter 10 digit mobile number",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 235, 235, 235))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppComponent.Green))),
                  )),
                  SizedBox(
                    height: 20.h,
                  ),
                  FullButton(title: "Get verification code", onPressed: () {}),
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
    );
  }
}
