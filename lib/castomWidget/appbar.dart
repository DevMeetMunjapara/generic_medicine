import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppComponent.logo,
                  height: 50.h,
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
                        child: SvgPicture.asset(AppComponent.lineArrow),
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
