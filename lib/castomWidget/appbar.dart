import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/profile.dart';

class MyAppBar {
  AppBar myapp(BuildContext context) {
    return AppBar(
      elevation: 3,
      toolbarHeight: 100.h,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        //color: Colors.amber,
        child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.h, bottom: 15.h),
            child: Row(
              children: [
                Image.asset(AppComponent.singlLogo),
                SizedBox(
                  width: 30.h,
                ),
                Expanded(
                  child: Text(
                    "Surat",
                    style: TextStyle(
                        color: AppComponent.NevyBlue, fontSize: 24.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: CircleAvatar(
                      backgroundColor: AppComponent.White,
                      radius: 30.h,
                      child: Image.asset(AppComponent.profile)),
                )
              ],
            )),
      ),
    );
  }

  AppBar myappWithTitel(BuildContext context, String title) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 100.h,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.h, bottom: 15.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                      radius: 25.sp,
                      backgroundColor: AppComponent.White,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(AppComponent.lineArrow),
                      )),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
                ),
              ],
            )),
      ),
    );
  }
}
