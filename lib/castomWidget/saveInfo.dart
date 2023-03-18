import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';

class SaveInfo extends StatefulWidget {
  const SaveInfo({super.key});

  @override
  State<SaveInfo> createState() => _SaveInfoState();
}

class _SaveInfoState extends State<SaveInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myapp(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 0.h),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.sp,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(AppComponent.lineArrow),
                      )),
                  SizedBox(
                    width: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fill-up all details",
                        style: TextStyle(
                            color: AppComponent.NevyBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        "Please correct details. Your details will\nbe Check pharmacist.",
                        style: TextStyle(
                            //color: AppComponent.NevyBlue,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
            Form(
              child: Expanded(
                  child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          form("Full name"),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 139, 139, 139)),
                          ),
                          TextFormField(
                            cursorColor: AppComponent.Green,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                width: 80.w,
                                child: Row(
                                  children: [
                                    Image.asset(AppComponent.india),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text("+ 91"),
                                  ],
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppComponent.Green),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.h, 0.h, 15.h, 0.h),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                value: false,
                                onChanged: (value) {}),
                          ),
                          Text(
                            "Will be used in",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Image.asset(AppComponent.whatsapp)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 0.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          form("Email"),
                          SizedBox(
                            height: 10.h,
                          ),
                          form("City"),
                          SizedBox(
                            height: 10.h,
                          ),
                          form("Country"),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget form(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 139, 139, 139)),
        ),
        TextFormField(
          cursorColor: AppComponent.Green,
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppComponent.Green),
            ),
          ),
        )
      ],
    );
  }
}
