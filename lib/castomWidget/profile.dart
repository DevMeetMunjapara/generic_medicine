import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/locationAdd.dart';
import 'package:generic_medicine/castomWidget/saveInfo.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myappWithTitel(context, "My Account setting"),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppComponent.profile,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "HET VANPARIYA",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SaveInfo()));
                            },
                            child: Text(
                              "EDIT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppComponent.Green,
                                  fontSize: 18.sp),
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "+91 0986543232",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 58, 85, 101)),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        "hetvanpariya@gmail.com",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 58, 85, 101)),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 3.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box("My Orders", "view all order list"),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 40.sp,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1.5.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box("My Prescriptions",
                          "View all past prescription photos"),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 40.sp,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1.5.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationAdd()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        box("My Address", "Check your address and edit here"),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 40.sp,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.5.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box("Request for Refunds",
                          "Refund status & Refund request"),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 40.sp,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terms & Conditions",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppComponent.Green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Generic medicine app is not a pharmacy drugs retailer Generic medicine app is only a bridge between consumer and pharmacy retailer . Consumer place doctor prescribed order to buy medicines and generic medicine app forward this prescription to pharmacy retailer",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 100, 121, 138),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FullButton(
                title: "Log Out", onPressed: () {}, mycolors: AppComponent.red),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "V 1.0.0",
              style: TextStyle(color: Color.fromARGB(255, 197, 197, 197)),
            )
          ],
        ),
      ),
    );
  }

  Widget box(String title, title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          title2,
          style: TextStyle(
              fontSize: 18.sp, color: Color.fromARGB(255, 58, 85, 101)),
        ),
      ],
    );
  }
}
