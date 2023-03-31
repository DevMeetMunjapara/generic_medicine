import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/intro/permission.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          body: PageView(
            controller: _pageController,
            children: [
              introOne(),
              introTwo(),
            ],
          )),
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
            child: Image.asset(
              AppComponent.logo,
              width: 200.h,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            //   color: Colors.amber,
            width: double.infinity,
            height: 400.h,
            child: Image(
                image: AssetImage(AppComponent.groupOne),
                fit: BoxFit.fitHeight),
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
            height: 40.h,
          ),
          SmoothPageIndicator(
            controller: _pageController, // PageController
            count: 2,
            effect: WormEffect(
                spacing: 10.sp,
                strokeWidth: 2,
                dotHeight: 15.sp,
                dotWidth: 25.sp,
                activeDotColor: AppComponent.Green,
                dotColor: Color.fromARGB(
                    255, 203, 234, 221)), // your preferred effect
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              child: FullButton(
                  title: "Continue",
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(microseconds: 1000),
                        curve: Curves.bounceIn);
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
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            child: Image.asset(
              AppComponent.logo,
              width: 200.h,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            //   color: Colors.amber,
            width: double.infinity,
            height: 400.h,
            child: Image(
                image: AssetImage(AppComponent.groupTwo),
                fit: BoxFit.fitHeight),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "100,000+ items\nto order from",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 36.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22.h),
          Text(
            "We have a wide range of products and brands available for you",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          SizedBox(
            height: 50.h,
          ),
          SmoothPageIndicator(
            controller: _pageController, // PageController
            count: 2,
            effect: WormEffect(
                spacing: 10.sp,
                strokeWidth: 2,
                dotHeight: 15.sp,
                dotWidth: 25.sp,
                activeDotColor: AppComponent.Green,
                dotColor: Color.fromARGB(
                    255, 203, 234, 221)), // your preferred effect
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
                        MaterialPageRoute(builder: (context) => Permission()));
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
}
