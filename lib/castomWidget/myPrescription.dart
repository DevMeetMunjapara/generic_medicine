import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class MyPrescription extends StatefulWidget {
  const MyPrescription({super.key});

  @override
  State<MyPrescription> createState() => _MyPrescriptionState();
}

class _MyPrescriptionState extends State<MyPrescription> {
  late List image = [];
  late List SelectImage = [];
  bool isSelcted = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final auth = FirebaseFirestore.instance
        .collection("allUser")
        .doc("+919409497905")
        .collection("myPrescriptions")
        .doc("image")
        .get()
        .then((value) {
      setState(() {
        image = value["image"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar().myappWithTitel(context, "My Prescriptions"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: image.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0.w,
                    mainAxisSpacing: 20.0.h),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onLongPress: () {
                        setState(() {
                          isSelcted = true;
                        });
                        print(SelectImage);
                      },
                      child: InstaImageViewer(
                          child: Image.network(image[index].toString())),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
