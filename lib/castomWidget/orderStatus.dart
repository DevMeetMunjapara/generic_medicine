import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/main.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timelines/timelines.dart';

class OrderStatus extends StatefulWidget {
  var OrderID;
  OrderStatus({super.key, required this.OrderID});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  var date;
  String? formattedDate;
  List imageList = [];
  TextEditingController _folorNumber = TextEditingController();
  TextEditingController _type = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("allOrder")
        .doc(widget.OrderID)
        .get()
        .then((value) {
      setState(() {
        date = value["time"];
        imageList = value["image"];
        print("------------$date");
        DateTime myDate = DateTime.parse(date);
        formattedDate = DateFormat('dd/MM/yyyy | ').format(myDate) +
            DateFormat.jm().format(myDate);
        print("-----------------$formattedDate");
        //  print("-----------------$imageList");
      });
    });
    var userInfo = FirebaseFirestore.instance
        .collection("allUser")
        .doc(userNumber)
        .get()
        .then((value) => {
              setState(() {
                _folorNumber.text = value["address"]["folorNumber"].toString() +
                    " " +
                    value["address"]["recipientName"].toString() +
                    " " +
                    value["address"]["pincode"].toString();
                _type.text = value["address"]["type"].toString();
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    print("-------------------$imageList");
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myappWithTitel(context, "My Orders"),
        body: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Container(
            padding: EdgeInsets.all(30.w),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order ID: ${widget.OrderID}",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Row(
                  children: [
                    Text(
                      "Date & Time : ",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    Text(
                      "$formattedDate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Container(
                    color: Colors.amber,
                    height: 250.sp,
                    width: 300.sp,
                    child: ListView.builder(
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 250.sp,
                          width: 300.sp,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageList[index]),
                          )),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  thickness: 1.sp,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.h, 20.h, 0.h, 10.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppComponent.homeAddress),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Delivering to ${_type.text}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                            Text(_folorNumber.text),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 12.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 255, 240),
                      borderRadius: BorderRadius.circular(10)),

                  child: Stack(
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 10.0.h,
                        padding: EdgeInsets.all(0),
                        animationDuration: 2500,
                        percent: 0.1,
                        barRadius: Radius.circular(15),
                        backgroundColor: Color.fromARGB(255, 218, 255, 240),
                        progressColor: AppComponent.Green,
                      ),
                      Positioned(
                          left: 0.65.sw,
                          child: DotIndicator(
                            size: 9,
                            color: AppComponent.Green,
                          )),
                      Positioned(
                          left: 0.3.sw,
                          child: DotIndicator(
                            size: 9,
                            color: AppComponent.Green,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Placed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppComponent.Green),
                    ),
                    Text(
                      "Out For Delivery",
                      style: TextStyle(
                          //  fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppComponent.Green),
                    ),
                    Text(
                      "Delivered",
                      style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppComponent.Green),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                FullButton(
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
                    mycolors: AppComponent.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
