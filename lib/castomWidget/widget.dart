import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';

class ShowInternetBox extends StatefulWidget {
  const ShowInternetBox({super.key});

  @override
  State<ShowInternetBox> createState() => _ShowInternetBoxState();
}

class _ShowInternetBoxState extends State<ShowInternetBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30.sp),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.sp)),
          width: double.infinity,
          height: 270.h,
          child: Material(
            child: Column(
              children: [
                Image.asset(
                  AppComponent.internet,
                  height: 100.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "No Internet Connection",
                  style: TextStyle(
                      color: AppComponent.Green,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Please check your internet connection",
                  style: TextStyle(color: Colors.black, fontSize: 20.sp),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 100.sp, right: 100.sp, top: 20.sp),
                  child: FullButton(
                      title: "Ok",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      mycolors: AppComponent.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
