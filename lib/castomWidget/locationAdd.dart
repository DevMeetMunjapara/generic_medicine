import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';

class LocationAdd extends StatefulWidget {
  const LocationAdd({super.key});

  @override
  State<LocationAdd> createState() => _LocationAddState();
}

class _LocationAddState extends State<LocationAdd> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myapp(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 10.h),
              child: Text(
                "Please add a detailed address. It will help our delivery executive to reach your location easily.",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 139, 88, 27),
                    fontSize: 16.sp),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(30.h, 30.h, 30.h, 10.h),
                width: double.infinity,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pin code",
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 139, 139),
                          fontSize: 18.sp,
                        ),
                      ),
                      TextFormField(
                        cursorColor: AppComponent.Green,
                        style: TextStyle(color: AppComponent.Green),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppComponent.Green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "House number, floor, building name, localiy",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 18.sp),
                      ),
                      TextFormField(
                        cursorColor: AppComponent.Green,
                        style: TextStyle(color: AppComponent.Green),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppComponent.Green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Recipient's name",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 18.sp),
                      ),
                      TextFormField(
                        cursorColor: AppComponent.Green,
                        style: TextStyle(color: AppComponent.Green),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppComponent.Green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Phone number",
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 18.sp),
                      ),
                      TextFormField(
                        cursorColor: AppComponent.Green,
                        style: TextStyle(color: AppComponent.Green),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppComponent.Green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Address name & type",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSelected1 = true;
                                isSelected2 = false;
                                isSelected3 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isSelected1 == true
                                      ? AppComponent.Green
                                      : Colors.white,
                                  border: Border.all(
                                      color: isSelected1 == true
                                          ? AppComponent.Green
                                          : Color.fromARGB(255, 126, 126, 126)),
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.fromLTRB(
                                  25.sp, 12.sp, 25.sp, 12.sp),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected1 == true
                                        ? Colors.white
                                        : Color.fromARGB(255, 126, 126, 126)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          InkWell(
                            onTap: () {
                              print("--------");

                              setState(() {
                                isSelected1 = false;
                                isSelected2 = true;
                                isSelected3 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isSelected2 == true
                                      ? AppComponent.Green
                                      : Colors.white,
                                  border: Border.all(
                                      color: isSelected2 == true
                                          ? AppComponent.Green
                                          : Color.fromARGB(255, 126, 126, 126)),
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.fromLTRB(
                                  25.sp, 12.sp, 25.sp, 12.sp),
                              child: Text(
                                "Office",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected2 == true
                                        ? Colors.white
                                        : Color.fromARGB(255, 126, 126, 126)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSelected1 = false;
                                isSelected2 = false;
                                isSelected3 = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isSelected3 == true
                                      ? AppComponent.Green
                                      : Colors.white,
                                  border: Border.all(
                                      color: isSelected3 == true
                                          ? AppComponent.Green
                                          : Color.fromARGB(255, 126, 126, 126)),
                                  borderRadius: BorderRadius.circular(18)),
                              padding: EdgeInsets.fromLTRB(
                                  25.sp, 12.sp, 25.sp, 12.sp),
                              child: Text(
                                "Other",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected3 == true
                                        ? Colors.white
                                        : Color.fromARGB(255, 126, 126, 126)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.h, 30.h, 30.h, 40.h),
            child: FullButton(
                title: "Save & Continue",
                onPressed: () {},
                mycolors: AppComponent.Green),
          ),
        ),
      ),
    );
  }
}
