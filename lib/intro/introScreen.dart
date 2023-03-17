import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InteroScreen extends StatefulWidget {
  const InteroScreen({super.key});

  @override
  State<InteroScreen> createState() => _InteroScreenState();
}

class _InteroScreenState extends State<InteroScreen> {
  @override
  Widget build(BuildContext context) {
    var wh = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;
    print("--------$wh");
    print("--------$hh");
    ScreenUtil.init(context, designSize: Size(wh, hh));

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              //color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage(AppComponent.introOne), fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                AppComponent.logo,
                width: 180.h,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(60),
              ),
              Container(
                color: Colors.amber,
                child: Image.asset(
                  AppComponent.groupOne,
                  height: 300.h,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Secure health \nUsing Generic app",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    //fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenUtil().radius(22),
              ),
              Text(
                "Prescription Upload - Verification -\nDoorstep Delivery - Get Medicine\nevery month",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(14)),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                "Skip 👀",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: FullButton(title: "Continue", onPressed: () {})),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                "Skip 👀",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
