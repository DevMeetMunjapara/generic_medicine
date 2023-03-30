import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/uploadPrescription.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance
        .collection("allUser")
        .doc("+919409497905")
        .collection("order");
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myappWithTitel(context, "My Orders"),
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.only(top: 30.sp),
                      child: StreamBuilder(
                        stream: db.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text(
                                "Some Error",
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          }
                          return Container(
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(30.sp),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 80.sp,
                                            width: 80.sp,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot.data!
                                                  .docs[index]["image"][0]),
                                            )),
                                          ),
                                          SizedBox(
                                            width: 10.sp,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Order ID: ${snapshot.data!.docs[index].reference.id.toString()}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.sp),
                                                ),
                                                Text(
                                                  "Track Your Order",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 100, 121, 138),
                                                      fontSize: 16.sp),
                                                )
                                              ],
                                            ),
                                          ),
                                          Image.asset(
                                            AppComponent.rightSite,
                                            height: 20.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0.3.sp,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
