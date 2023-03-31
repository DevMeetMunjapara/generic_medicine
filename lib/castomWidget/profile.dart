import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/locationAdd.dart';
import 'package:generic_medicine/castomWidget/myOrder.dart';
import 'package:generic_medicine/castomWidget/partner.dart';
import 'package:generic_medicine/castomWidget/saveInfo.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _name;
  var _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var userInfo = FirebaseFirestore.instance
        .collection("allUser")
        .doc(userNumber)
        .get()
        .then((value) => {
              setState(() {
                _name = value["name"];
                _email = value["email"];
              })
            });
  }

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
                  SvgPicture.asset(
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
                          "$_name",
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
                        "$userNumber",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 58, 85, 101)),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        "$_email",
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyOrder()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        box("My Orders", "view all order list"),
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
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Partner()));
              },
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Become a Franchise Partner",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 97, 62),
                            fontSize: 18.sp),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 40.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FullButton(
                title: "Log Out",
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false);
                },
                mycolors: AppComponent.red),
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
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Making Healthcare",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 180, 180, 180),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "Accessible & Affordable",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color.fromARGB(255, 197, 196, 172),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  const Text(
                    "Made with ❤️ by Generic medicine",
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
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
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          title2,
          style: TextStyle(
              fontSize: 16.sp, color: Color.fromARGB(255, 58, 85, 101)),
        ),
      ],
    );
  }
}
