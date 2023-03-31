import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/intro/permission.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InteroScreen extends StatefulWidget {
  const InteroScreen({super.key});

  @override
  State<InteroScreen> createState() => _InteroScreenState();
}

class _InteroScreenState extends State<InteroScreen> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 37, 30),
        body: introOne(),
      ),
    );
  }

  Widget introOne() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            child: SvgPicture.asset(
              AppComponent.logo,
              height: 60.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            child: SvgPicture.asset(
              AppComponent.groupOne,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 410.h,
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
                fontSize: 36.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Prescription Upload - Verification -\nDoorstep Delivery - Get Medicine\nevery month",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          SizedBox(
            height: 30.h,
          ),
          SvgPicture.asset(
            AppComponent.groupOnePage,
            height: 20,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              child: FullButton(
                  title: "Continue",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => introTwo()));
                  },
                  mycolors: AppComponent.Green)),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Permission()));
            },
            child: Text(
              "Skip 👀",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget introTwo() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 37, 30),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                child: SvgPicture.asset(
                  AppComponent.logo,
                  height: 60.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                child: SvgPicture.asset(
                  AppComponent.groupTwo,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 410.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "100,000+ items to\norder from",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "We have a wide range of products\nand brands available for you\n",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              SvgPicture.asset(
                AppComponent.groupTwoPage,
                height: 20,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 20.r),
                  child: FullButton(
                      title: "Continue",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Permission()));
                      },
                      mycolors: AppComponent.Green)),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Permission()));
                },
                child: Text(
                  "Skip 👀",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
