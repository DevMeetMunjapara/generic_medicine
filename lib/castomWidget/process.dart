import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';

class Process extends StatefulWidget {
  const Process({super.key});

  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.h, right: 30.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.h,
                    backgroundColor: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(7.h),
                        child: Image.asset(AppComponent.lineArrow)),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "How would you like us to process\nyour request?",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: AppComponent.NevyBlue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order everything from the\nprescription",
                              style: TextStyle(
                                  color: AppComponent.Green,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              "Our pharmacist will arrange medicines as\nper your prescription.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Image.asset(AppComponent.tickmark)
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.5.sp,
                  ),
                  Material(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 10.h),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 25.sp,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 248, 256),
                              child: Image.asset(AppComponent.flash)),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "We will take about",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 101, 175, 131),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "30 Minutes",
                                    style: TextStyle(
                                        color: AppComponent.Green,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "to process your request",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
