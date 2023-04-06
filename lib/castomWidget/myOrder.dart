import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/process.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List docList = <int>[];
    List loops = [];
    QuerySnapshot<Map<String, dynamic>> mydata;
    var mysnapshot;

    mysnapshot = FirebaseFirestore.instance
        .collection("allUser")
        .doc("+919409497905")
        .collection("order")
        .get()
        .then((value) {
      mydata = value;

      for (var i = 0; i < value.size; i++) {
        docList.add(int.parse(value.docs[i].id));
        // print("----------${value.docs[i].id}");
        // print("----------${value.docs[i]["time"]}");

        //  print(docList[i].runtimeType);
      }
      docList.sort();
      for (var i = docList.length - 1; i >= 0; i--) {
        loops.add(docList[i]);
        print(loops);
      }
    });

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
                                for (var i = 0; i <= loops.length; i++) {
                                  if (loops[index].toString() ==
                                      snapshot.data!.docs[i].reference.id) {
                                    print(loops[index].toString());
                                    print(loops.length);
                                    return StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('allUser')
                                          .doc(userNumber)
                                          .collection("order")
                                          .doc(loops[index].toString())
                                          .snapshots(),
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

                                        // return Text(snapshot.data!["image"][0]);
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Process(
                                                            OrderID:
                                                                snapshot.data![
                                                                    "orderId"],
                                                            OrderStatus:
                                                                snapshot.data![
                                                                    "status"])));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 30.sp,
                                                right: 30.sp,
                                                top: 10.sp),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 80.sp,
                                                      width: 80.sp,
                                                      child: InstaImageViewer(
                                                        child: Image.network(
                                                          snapshot.data![
                                                              "image"][0],
                                                          fit: BoxFit.cover,
                                                          height: 150.h,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.sp,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Order ID: ${snapshot.data!["orderId"].toString()}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    18.sp),
                                                          ),
                                                          Text(
                                                            "Track Your Order",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        100,
                                                                        121,
                                                                        138),
                                                                fontSize:
                                                                    16.sp),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
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
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }

                                return SizedBox.shrink();
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
