import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/howToProcess.dart';
import 'package:generic_medicine/castomWidget/myPrescription.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

late String userNumber;

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({super.key});

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  File? prescription;
  bool isSelectImage = false;
  bool isOneUpload = false;
  bool isLoading = false;
  int curuntPage = 0;
  List myList = [];
  List myFileNameList = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNumber = FirebaseAuth.instance.currentUser!.phoneNumber.toString();
    print(userNumber);
  }

  @override
  Widget build(BuildContext context) {
    print(myList);
    print(myFileNameList);
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myapp(context),
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Material(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(30.h),
                //height: 300.h,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isOneUpload == false
                          ? "Upload Prescription"
                          : "${myList.length} prescription attached",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: AppComponent.Green),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "A pharmacist will arrange your medicines for you",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    isOneUpload == false
                        ? Center(child: SvgPicture.asset(AppComponent.home))
                        : Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 150.h,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    onPageChanged: (value) {
                                      setState(() {
                                        curuntPage = value;
                                      });
                                    },
                                    itemCount: myList.length,
                                    itemBuilder: (context, index) {
                                      return InstaImageViewer(
                                        child: Image.file(
                                          myList[index],
                                          height: 150.h,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                SmoothPageIndicator(
                                  controller: _pageController,
                                  count: myList.length,
                                  effect: WormEffect(
                                      spacing: 10.sp,
                                      dotHeight: 15.sp,
                                      dotWidth: 15.sp,
                                      activeDotColor: AppComponent.Green,
                                      dotColor:
                                          Color.fromARGB(255, 203, 234, 221)),
                                )
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    isOneUpload == true
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                myList.removeAt(curuntPage);
                                myFileNameList.removeAt(curuntPage);
                              });
                              if (myList.length == 0) {
                                setState(() {
                                  isOneUpload = false;
                                });
                              }
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Delete Prescription",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppComponent.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: AppComponent.Green),
                            elevation: 0,
                            backgroundColor: isOneUpload == true
                                ? Colors.white
                                : AppComponent.Green,
                          ),
                          onPressed: () {
                            showBox();
                          },
                          child: Text(
                            "Upload Prescription",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: isOneUpload == true
                                    ? AppComponent.Green
                                    : Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Visibility(
                      visible: isOneUpload,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(color: AppComponent.Green),
                            elevation: 0,
                            backgroundColor: AppComponent.Green,
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HowToProcess(
                                          myFileNameList: myFileNameList,
                                          myList: myList,
                                        ))).then((value) {
                              myFileNameList = [];
                              myList = [];
                            });

                            setState(() {
                              isLoading = false;
                              isOneUpload = false;
                            });
                          },
                          child: isLoading == false
                              ? Text(
                                  "Confirm Prescription",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                )
                              : CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Text(
                      "How it work?",
                      style: TextStyle(
                          fontSize: 18.h,
                          color: AppComponent.Green,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is a valid prescription?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Color.fromARGB(255, 57, 149, 113)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "as per indian medical laws a valid prescription should have the following information:",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "A valid prescription contains:",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Color.fromARGB(255, 57, 149, 113)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Doctor Details\nDate of Prescription\nPatient Details\nDosage Details",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppComponent.Green,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppComponent.valid,
                    height: 150.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showOption(String image, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 25.h, right: 25.h, bottom: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            width: 10.h,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SvgPicture.asset(AppComponent.arrowRight),
        ],
      ),
    );
  }

  showBox() => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300.h,
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.h, right: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upload prescription",
                        style: TextStyle(
                            fontSize: 22.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(AppComponent.cancel))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  thickness: 1.5.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.camera);

                    if (image == null) {
                      return;
                    }
                    String fileName = image.path.split('/').last;
                    final temporyImage = File(image.path);
                    prescription = temporyImage;
                    setState(() {
                      isSelectImage = true;
                      isOneUpload = true;
                      myList.add(prescription);
                      myFileNameList.add(fileName);

                      print(prescription);
                    });
                    Navigator.pop(context);
                  },
                  child: showOption(AppComponent.photo, "Take a photo"),
                ),
                InkWell(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image == null) {
                      return;
                    }
                    String fileName = image.path.split('/').last;
                    final temporyImage = File(image.path);
                    prescription = temporyImage;
                    setState(() {
                      isSelectImage = true;
                      isOneUpload = true;
                      myList.add(prescription);
                      myFileNameList.add(fileName);
                    });
                    Navigator.pop(context);
                  },
                  child:
                      showOption(AppComponent.gallery, "Choose from gallery"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyPrescription()));
                  },
                  child: showOption(
                      AppComponent.prescription, "Your prescription"),
                ),
              ],
            ),
          );
        },
      );
}
