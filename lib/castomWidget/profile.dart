import 'dart:io';
import 'dart:typed_data';

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
import 'package:generic_medicine/castomWidget/locationAdd.dart';
import 'package:generic_medicine/castomWidget/myOrder.dart';
import 'package:generic_medicine/castomWidget/partner.dart';
import 'package:generic_medicine/castomWidget/saveInfo.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _name;
  var _email;
  var _profileImage;

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
                _profileImage = value["profileImage"];
              }),
              print("-----------$_profileImage")
            });
  }

  @override
  Widget build(BuildContext context) {
    List docList = <int>[];
    List loops = [];
    var mysnapshot;
    bool isImageUpdate = false;
    bool isNewUpload = false;

    if (_profileImage != null) {
      setState(() {
        isImageUpdate = true;
      });
    } else {}

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
                      final path = "${userNumber}";
                      final file = File(image.path);
                      print(file);

                      final ref = FirebaseStorage.instance.ref().child(path);

                      UploadTask uploadTask = ref.putFile(file);
                      final snapshot = await uploadTask.whenComplete(() {});
                      final url = await snapshot.ref.getDownloadURL();
                      await FirebaseFirestore.instance
                          .collection("allUser")
                          .doc(userNumber)
                          .set({"profileImage": url.toString()},
                              SetOptions(merge: true));
                      setState(() {
                        isImageUpdate = true;
                      });

                      print("---------$url");

                      Navigator.pop(context);
                      var userInfo = FirebaseFirestore.instance
                          .collection("allUser")
                          .doc(userNumber)
                          .get()
                          .then((value) => {
                                setState(() {
                                  _name = value["name"];
                                  _email = value["email"];
                                  _profileImage = value["profileImage"];
                                }),
                                print("-----------$_profileImage")
                              });
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

                      Navigator.pop(context);
                    },
                    child:
                        showOption(AppComponent.gallery, "Choose from gallery"),
                  ),
                ],
              ),
            );
          },
        );

    mysnapshot = FirebaseFirestore.instance
        .collection("allUser")
        .doc(userNumber)
        .collection("order")
        .get()
        .then((value) {
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
                  GestureDetector(
                    onTap: () {
                      showBox();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppComponent.White,
                      radius: 30.h,
                      child: isImageUpdate == false
                          ? SvgPicture.asset(AppComponent.user)
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(_profileImage),
                                  )),
                            ),
                    ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyOrder(
                                    loops: loops,
                                  )));
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationAdd(
                                    myFileNameList: [],
                                    myList: [],
                                  )));
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
                        fontSize: 18.sp),
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
