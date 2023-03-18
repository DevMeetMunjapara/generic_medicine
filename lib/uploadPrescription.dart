import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({super.key});

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myapp(),
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Material(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(30.h),
                //height: 300.h,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Prescription",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: AppComponent.Green),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "A pharmacist will arrange your medicines for you",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: Image.asset(
                      AppComponent.home,
                      height: 150.h,
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    FullButton(
                        title: "Upload Prescription",
                        mycolors: AppComponent.Green,
                        onPressed: () {
                          {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 350.h,
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.h, right: 25.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Upload prescription",
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Image.asset(AppComponent.cancel)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        thickness: 1.5.h,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      showOption(
                                          AppComponent.photo, "Take a photo"),
                                      showOption(AppComponent.gallery,
                                          "Choose from gallery"),
                                      showOption(AppComponent.prescription,
                                          "Your prescription"),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Text(
                      "How it work?",
                      style: TextStyle(
                          fontSize: 20.h,
                          color: AppComponent.Green,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.h),
              child: Column(
                children: [
                  Text(
                    "All Upload are encrypted & visible only to our pharmacists.",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Color.fromARGB(255, 210, 201, 182)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Any prescription you upload is validated before processing the order.",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Color.fromARGB(255, 210, 201, 182)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What is a valid prescription?",
                      style:
                          TextStyle(fontSize: 20.sp, color: AppComponent.Green),
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

  Widget showOption(String image, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 25.h, right: 25.h, bottom: 10.h),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(AppComponent.arrowRight),
        ],
      ),
    );
  }
}
