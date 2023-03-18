import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
        appBar: MyAppBar().myapp(),
        body: Column(
          children: [
            Container(
              height: 10.h,
              width: double.infinity,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.fromLTRB(30.h, 50.h, 30.h, 0.h),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(AppComponent.process),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Verifying your Prescription",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                              color: Color.fromARGB(255, 30, 68, 52)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Your Prescription will be send pharmacist.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        LinearPercentIndicator(
                          animation: true,
                          //backgroundColor: Color.fromARGB(255, 255, 242, 216),
                          lineHeight: 10.0,
                          animationDuration: 2500,
                          percent: 0.8,
                          // progressColor: Color.fromARGB(255, 245, 197, 27),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: LinearProgressIndicator(
                            minHeight: 9.h,
                            backgroundColor: Color.fromARGB(255, 255, 242, 216),
                            color: Color.fromARGB(255, 245, 197, 27),
                            value: 0.8,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Processed your requests",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Color.fromARGB(255, 129, 102, 6)),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Image.asset(AppComponent.doctor),
                            SizedBox(
                              width: 18.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Requsted will send pharmacist",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 20, 46, 35),
                                    )),
                                Text(
                                    "Certified Generic Medicine pharmacist 2022",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 20.sp,
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
                                          color: Color.fromARGB(255, 8, 97, 62),
                                          fontSize: 20.sp,
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
                      ],
                    )))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          color: Colors.white,
          height: 80.h,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
                child: FullButton(
                    title: "Cancel Order",
                    onPressed: () {},
                    mycolors: AppComponent.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
