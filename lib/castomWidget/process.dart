import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/orderStatus.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Process extends StatefulWidget {
  var OrderID;
  var OrderStatus;
  Process({super.key, required this.OrderID, required this.OrderStatus});

  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // FirebaseFirestore.instance
    //     .collection("allOrder")
    //     .doc(widget.OrderID)
    //     .get()
    //     .then((value) {
    //   setState(() {
    //     orderStatus = value["status"];
    //     print("--------------$orderStatus");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("--------------${widget.OrderID}");
    return SafeArea(
      child: GestureDetector(
          child: widget.OrderStatus == "1"
              ? statusOne()
              : widget.OrderStatus == "2"
                  ? statusTwo()
                  : statusThree()),
    );
  }

  Widget statusOne() {
    return Scaffold(
      appBar: MyAppBar().myapp(context),
      body: Column(
        children: [
          Container(
            height: 10.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(30.h, 50.h, 30.h, 0.h),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppComponent.process,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Verifying your Prescription",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp,
                            color: Color.fromARGB(255, 30, 68, 52)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Your Prescription will be send pharmacist.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 0.4.sw,
                              child: LinearPercentIndicator(
                                animation: true,
                                lineHeight: 9.0.h,
                                padding: EdgeInsets.all(0),
                                animationDuration: 2500,
                                percent: 0.8,
                                barRadius: Radius.circular(15),
                                backgroundColor:
                                    Color.fromARGB(255, 255, 242, 216),
                                progressColor:
                                    Color.fromARGB(255, 245, 197, 27),
                              ),
                            ),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Expanded(
                              child: Container(
                                width: 0.4.sw,
                                child: SizedBox(
                                  child: LinearPercentIndicator(
                                    animation: true,
                                    lineHeight: 9.0.h,
                                    padding: EdgeInsets.all(0),
                                    animationDuration: 2500,
                                    percent: 0,
                                    barRadius: Radius.circular(15),
                                    backgroundColor:
                                        Color.fromARGB(255, 218, 255, 240),
                                    progressColor:
                                        Color.fromARGB(255, 245, 197, 27),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Processed your requests",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Color.fromARGB(255, 129, 102, 6)),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppComponent.doctor),
                          SizedBox(
                            width: 18.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Requsted will send pharmacist",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 20, 46, 35),
                                  )),
                              Text("Certified Generic Medicine pharmacist 2022",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20.sp,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 248, 256),
                              child: SvgPicture.asset(AppComponent.flash)),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "We will take about",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 101, 175, 131),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "30 Minutes",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 97, 62),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "to process your request",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: 80.h,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
              child: FullButton(
                  title: "Cancel Order",
                  onPressed: () async {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == true) {
                      await FirebaseFirestore.instance
                          .collection("allOrder")
                          .doc(widget.OrderID)
                          .set({"status": "3"}, SetOptions(merge: true));
                      await FirebaseFirestore.instance
                          .collection("allUser")
                          .doc(userNumber)
                          .collection("order")
                          .doc(widget.OrderID)
                          .set({"status": "3"}, SetOptions(merge: true));
                      setState(() {});
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ShowInternetBox();
                          });
                    }
                  },
                  mycolors: AppComponent.red),
            )
          ],
        ),
      ),
    );
  }

  Widget statusTwo() {
    return Scaffold(
      appBar: MyAppBar().myapp(context),
      body: Column(
        children: [
          Container(
            height: 10.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(30.h, 50.h, 30.h, 0.h),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppComponent.orderApprove,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Confirm your Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp,
                            color: Color.fromARGB(255, 30, 68, 52)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Your Prescription will be Process",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 9.0.h,
                          padding: EdgeInsets.all(0),
                          animationDuration: 2500,
                          percent: 1,
                          barRadius: Radius.circular(15),
                          progressColor: AppComponent.Green,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.sp),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Approved your requests",
                            style: TextStyle(
                                fontSize: 18.sp, color: AppComponent.Green),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            AppComponent.doctor,
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rejected your request",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 20, 46, 35),
                                    )),
                                Text(
                                    "Certified Generic Medicine\npharmacist 2022",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                          SvgPicture.asset(AppComponent.orederApproveDone)
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 20.sp,
                              backgroundColor:
                                  Color.fromARGB(255, 229, 255, 241),
                              child: SvgPicture.asset(AppComponent.mony)),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Payment Available Only",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 101, 175, 131),
                                ),
                              ),
                              Text(
                                "Case on Delivery",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 97, 62),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: 130.h,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
              child: FullButton(
                  title: "Check your order status",
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderStatus(
                                  OrderID: widget.OrderID,
                                )));
                  },
                  mycolors: AppComponent.Green),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
              child: FullButton(
                  title: "Cancel Order",
                  onPressed: () async {
                    bool result =
                        await InternetConnectionChecker().hasConnection;
                    if (result == true) {
                      await FirebaseFirestore.instance
                          .collection("allOrder")
                          .doc(widget.OrderID)
                          .set({"status": "3"}, SetOptions(merge: true));
                      await FirebaseFirestore.instance
                          .collection("allUser")
                          .doc(userNumber)
                          .collection("order")
                          .doc(widget.OrderID)
                          .set({"status": "3"}, SetOptions(merge: true));
                      setState(() {});
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ShowInternetBox();
                          });
                    }
                  },
                  mycolors: AppComponent.red),
            )
          ],
        ),
      ),
    );
  }

  Widget statusThree() {
    return Scaffold(
      appBar: MyAppBar().myapp(context),
      body: Column(
        children: [
          Container(
            height: 10.h,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(30.h, 50.h, 30.h, 0.h),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppComponent.orderClose,
                        height: 150,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Your Order is Cancel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.sp,
                            color: Color.fromARGB(255, 30, 68, 52)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Your Prescription will be filled",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 9.0.h,
                          padding: EdgeInsets.all(0),
                          animationDuration: 2500,
                          percent: 1,
                          barRadius: Radius.circular(15),
                          progressColor: Color.fromARGB(255, 181, 36, 36),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Rejected your requests",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color.fromARGB(255, 181, 36, 36),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            AppComponent.doctor,
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rejected your request",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 20, 46, 35),
                                    )),
                                Text(
                                    "Certified Generic Medicine\npharmacist 2022",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                          SvgPicture.asset(AppComponent.cancel)
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  )))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: 100.h,
        width: double.infinity,
        child: Column(
          children: [
            Text("Your order request is Fail",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppComponent.red,
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
              child: FullButton(
                title: "Back to home page",
                mycolors: AppComponent.Green,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
