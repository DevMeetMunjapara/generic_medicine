import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/criculerProcess.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/locationAdd.dart';
import 'package:generic_medicine/castomWidget/myOrder.dart';
import 'package:generic_medicine/castomWidget/myPrescription.dart';
import 'package:generic_medicine/castomWidget/process.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HowToProcess extends StatefulWidget {
  List myFileNameList;
  List myList;
  HowToProcess({
    super.key,
    required this.myFileNameList,
    required this.myList,
  });

  @override
  State<HowToProcess> createState() => _HowToProcessState();
}

class _HowToProcessState extends State<HowToProcess> {
  TextEditingController _folorNumber = TextEditingController();
  TextEditingController _type = TextEditingController();
  bool loading = false;
  late Timer timer;
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("allUser")
        .doc(userNumber)
        .get()
        .then((value) => {
              print("----------------ok"),
              setState(() {
                _folorNumber.text = value["address"]["folorNumber"].toString();
                _type.text = value["address"]["type"].toString();
                _folorNumber.text = _folorNumber.text.toString().substring(
                          0,
                        ) +
                    " ...";
              })
            });
    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("---------${widget.myFileNameList}");
    print("---------${widget.myList}");
    return SafeArea(
      child: Scaffold(
        //   appBar: MyAppBar().myapp(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.h, right: 30.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20.h,
                        backgroundColor: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(7.h),
                            child: SvgPicture.asset(AppComponent.lineArrow)),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "How would you like us to process\nyour request?",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppComponent.NevyBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Material(
                color: Colors.white,
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order everything from the\nprescription",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 8, 97, 62),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                  "Our pharmacist will arrange medicines as\nper your prescription.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            SvgPicture.asset(
                              AppComponent.tickmark,
                              height: 50.h,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.h, 0.h, 30.h, 10.h),
                        child: Row(
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
                                Text(
                                  "We will take about",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color.fromARGB(255, 101, 175, 131),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "30 Minutes",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 8, 97, 62),
                                          fontSize: 16.sp,
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
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Material(
                color: Colors.white,
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 10.h),
                          child: Text(
                            "What will the pharmacist do?",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        thickness: 1.5.sp,
                      ),
                      Container(
                        height: 240.h,
                        child: PageView(controller: pageController, children: [
                          ConOne(
                              AppComponent.taskOne,
                              "",
                              "",
                              "Add medicines as per prescription",
                              "The pharmacist will add medicines basis your prescription."),
                          ConOne(
                              AppComponent.taskOne,
                              AppComponent.taskTwo,
                              "",
                              "Fulfil all details in form",
                              "After pharmacist will add, Fill your\npersonal details."),
                          ConOne(
                              AppComponent.taskOne,
                              AppComponent.taskTwo,
                              AppComponent.taskThree,
                              "Place your medicine order",
                              "The pharmacist will place your order. Approved your all details after will be placed your order.")
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Material(
                color: Colors.white,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30.h, 20.h, 30.h, 10.h),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total bill amount will be calculated after a case on delivery order is placed for your medicines.",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      Text(
                        "Pay Method only Case on delivery.",
                        style: TextStyle(
                            color: Color.fromARGB(255, 57, 149, 113),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          color: Colors.white,
          height: 190.h,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 10.h),
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
                          _folorNumber.text == ""
                              ? Text(
                                  "Add You Address",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "Delivering to ${_type.text}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                          _folorNumber.text == ""
                              ? SizedBox()
                              : Text(_folorNumber.text),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationAdd(
                                      isListPasrse: true,
                                      myList: widget.myList,
                                      myFileNameList: widget.myList,
                                    )));
                      },
                      child: Text(
                        _folorNumber.text == "" ? "Add" : "Change",
                        style: TextStyle(
                            color: _folorNumber.text == ""
                                ? AppComponent.red
                                : AppComponent.Green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1.5.sp,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.h, 5.h, 20.h, 0.h),
                child: FullButton(
                    title: "Place medicine request",
                    loading: loading,
                    mycolors: _folorNumber.text == ""
                        ? AppComponent.red
                        : AppComponent.Green,
                    onPressed: () async {
                      bool result =
                          await InternetConnectionChecker().hasConnection;
                      if (result == true) {
                        if (_folorNumber.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.white,
                              content: Container(
                                padding: EdgeInsets.all(16.sp),
                                height: 70.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "Add your address after procrss",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.sp),
                                  ),
                                ),
                              )));
                        } else {
                          setState(() {
                            loading = true;
                          });
                          var totalCount;
                          var time = DateTime.now();

                          var auth = await FirebaseFirestore.instance
                              .collection("allOrder");

                          var count = auth.get().then(
                            (value) async {
                              totalCount = value.docs.length;
                              print("------$totalCount");
                              List urlFirebaseImage = [];

                              final _firebaseStorage = FirebaseStorage.instance;

                              for (var i = 0;
                                  i < widget.myFileNameList.length;
                                  i++) {
                                final path =
                                    "${userNumber + "/2023000${totalCount + 1}"}/${i}";
                                final file = File(widget.myList[i]!.path);
                                final ref =
                                    FirebaseStorage.instance.ref().child(path);

                                UploadTask uploadTask = ref.putFile(file);
                                final snapshot =
                                    await uploadTask.whenComplete(() {});
                                final url = await snapshot.ref.getDownloadURL();
                                urlFirebaseImage.add(url);
                                print("---------$url");
                                print(urlFirebaseImage);
                              }
//all Order Data Set
                              String phoneNumber = userNumber;
                              String phoneNumberWithoutPrefix =
                                  phoneNumber.replaceAll("+91", "");
                              print(
                                  phoneNumberWithoutPrefix); // Output: 9913772184

                              auth.doc("2023000${totalCount + 1}").set({
                                "orderId": "2023000${totalCount + 1}",
                                "time": time.toString(),
                                "status": "1",
                                "number": phoneNumberWithoutPrefix,
                                "image": urlFirebaseImage,
                              });
                              //User Data Set
                              await FirebaseFirestore.instance
                                  .collection("allUser")
                                  .doc(userNumber)
                                  .collection("order")
                                  .doc("2023000${totalCount + 1}")
                                  .set({
                                "orderId": "2023000${totalCount + 1}",
                                "time": time.toString(),
                                "status": "1",
                                "number": phoneNumberWithoutPrefix,
                                "image": urlFirebaseImage,
                              });
                              setState(() {
                                loading = false;
                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Process(
                                            OrderID: "2023000${totalCount + 1}",
                                            OrderStatus: "1",
                                          )));
                            },
                          );
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowInternetBox();
                            });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ConOne(String image1, image2, image3, title, title2) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.sp),
                      color: AppComponent.Green),
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.sp),
                          color: Color.fromARGB(255, 20, 46, 35)),
                      padding: EdgeInsets.all(10.sp),
                      child: SvgPicture.asset(image1)),
                ),
                SizedBox(
                  width: 20.w,
                ),
                image2 == ""
                    ? Container(
                        height: 85.h,
                        width: 85.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: Color.fromARGB(255, 203, 234, 221)),
                        padding: EdgeInsets.all(10.sp),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: AppComponent.Green),
                        padding: EdgeInsets.all(10.sp),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.sp),
                                color: Color.fromARGB(255, 20, 46, 35)),
                            padding: EdgeInsets.all(8.sp),
                            child: SvgPicture.asset(image2)),
                      ),
                SizedBox(
                  width: 20.w,
                ),
                image3 == ""
                    ? Container(
                        height: 85.h,
                        width: 85.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: Color.fromARGB(255, 203, 234, 221)),
                        padding: EdgeInsets.all(10.sp),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.sp),
                            color: AppComponent.Green),
                        padding: EdgeInsets.all(10.sp),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.sp),
                                color: Color.fromARGB(255, 20, 46, 35)),
                            padding: EdgeInsets.all(8.sp),
                            child: SvgPicture.asset(image3)),
                      ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppComponent.NevyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 3.sp,
            ),
            Text(
              title2,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
            SizedBox(
              height: 10.sp,
            ),
            SmoothPageIndicator(
              controller: pageController, // PageController
              count: 3,
              effect: WormEffect(
                  spacing: 10.sp,
                  dotHeight: 15.sp,
                  dotWidth: 15.sp,
                  activeDotColor: AppComponent.Green,
                  dotColor: Color.fromARGB(
                      255, 203, 234, 221)), // your preferred effect
            )
          ],
        ));
  }
}
