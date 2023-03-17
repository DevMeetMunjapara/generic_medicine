import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      toolbarHeight: 100.h,
      backgroundColor: Colors.white,
      title: Container(
        //color: Colors.amber,
        child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.h),
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
                CircleAvatar(
                    backgroundColor: AppComponent.White,
                    radius: 30.h,
                    child: Image.asset(AppComponent.profile))
              ],
            )),
      ),
    );
  }
}
