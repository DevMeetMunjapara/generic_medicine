import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/BocSaveData.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:generic_medicine/castomWidget/howToProcess.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LocationAdd extends StatefulWidget {
  bool? isListPasrse;
  List myFileNameList = [];
  List myList = [];
  LocationAdd({
    super.key,
    required this.myFileNameList,
    required this.myList,
    this.isListPasrse,
  });

  @override
  State<LocationAdd> createState() => _LocationAddState();
}

class _LocationAddState extends State<LocationAdd> {
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _folorNumber = TextEditingController();
  TextEditingController _recipientName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
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
                print("-------" + value["address"]["folorNumber"].toString());
                _pincode.text = value["address"]["pincode"].toString();
                _folorNumber.text = value["address"]["folorNumber"].toString();
                _recipientName.text =
                    value["address"]["recipientName"].toString();
                _phoneNumber.text = value["address"]["phoneNumber"].toString();
                if (value["address"]["type"] == "Home") {
                  setState(() {
                    isSelected1 = true;
                    isSelected2 = false;
                    isSelected3 = false;
                  });
                }
                if (value["address"]["type"] == "Office") {
                  setState(() {
                    isSelected1 = false;
                    isSelected2 = true;
                    isSelected3 = false;
                  });
                }
                if (value["address"]["type"] == "Other") {
                  setState(() {
                    isSelected1 = false;
                    isSelected2 = false;
                    isSelected3 = true;
                  });
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: MyAppBar().myappwithLogo(context),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 10.h),
                  child: Text(
                    "Please add a detailed address. It will help our delivery executive to reach your location easily.",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 139, 88, 27),
                        fontSize: 16.sp),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(30.h, 30.h, 30.h, 10.h),
                  width: double.infinity,
                  //height: 0.8.sh,
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pin code",
                          style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 18.sp,
                          ),
                        ),
                        TextFormField(
                          controller: _pincode,
                          cursorColor: AppComponent.Green,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppComponent.Green),
                            ),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Enter pin code number";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "House number, floor, building name, localiy",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18.sp),
                        ),
                        TextFormField(
                          controller: _folorNumber,
                          cursorColor: AppComponent.Green,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppComponent.Green),
                            ),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "House number etc...";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Recipient's name",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18.sp),
                        ),
                        TextFormField(
                            controller: _recipientName,
                            cursorColor: AppComponent.Green,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppComponent.Green),
                              ),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Enter your Recipient's name";
                              }
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Phone number",
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 139, 139),
                              fontSize: 18.sp),
                        ),
                        TextFormField(
                            controller: _phoneNumber,
                            cursorColor: AppComponent.Green,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppComponent.Green),
                              ),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Enter Mobile Number";
                              }
                              if (value!.length != 10) {
                                return 'Only 10 digit number valid';
                              }
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Address name & type",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected1 = true;
                                  isSelected2 = false;
                                  isSelected3 = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isSelected1 == true
                                        ? AppComponent.Green
                                        : Colors.white,
                                    border: Border.all(
                                        color: isSelected1 == true
                                            ? AppComponent.Green
                                            : Color.fromARGB(
                                                255, 126, 126, 126)),
                                    borderRadius: BorderRadius.circular(18)),
                                padding: EdgeInsets.fromLTRB(
                                    25.sp, 12.sp, 25.sp, 12.sp),
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected1 == true
                                          ? Colors.white
                                          : Color.fromARGB(255, 126, 126, 126)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            InkWell(
                              onTap: () {
                                print("--------");

                                setState(() {
                                  isSelected1 = false;
                                  isSelected2 = true;
                                  isSelected3 = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isSelected2 == true
                                        ? AppComponent.Green
                                        : Colors.white,
                                    border: Border.all(
                                        color: isSelected2 == true
                                            ? AppComponent.Green
                                            : Color.fromARGB(
                                                255, 126, 126, 126)),
                                    borderRadius: BorderRadius.circular(18)),
                                padding: EdgeInsets.fromLTRB(
                                    25.sp, 12.sp, 25.sp, 12.sp),
                                child: Text(
                                  "Office",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected2 == true
                                          ? Colors.white
                                          : Color.fromARGB(255, 126, 126, 126)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.sp,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected1 = false;
                                  isSelected2 = false;
                                  isSelected3 = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isSelected3 == true
                                        ? AppComponent.Green
                                        : Colors.white,
                                    border: Border.all(
                                        color: isSelected3 == true
                                            ? AppComponent.Green
                                            : Color.fromARGB(
                                                255, 126, 126, 126)),
                                    borderRadius: BorderRadius.circular(18)),
                                padding: EdgeInsets.fromLTRB(
                                    25.sp, 12.sp, 25.sp, 12.sp),
                                child: Text(
                                  "Other",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected3 == true
                                          ? Colors.white
                                          : Color.fromARGB(255, 126, 126, 126)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          width: double.infinity,
                          child: FullButton(
                              title: "Save & Continue",
                              onPressed: () async {
                                if (_form.currentState!.validate()) {
                                  bool result =
                                      await InternetConnectionChecker()
                                          .hasConnection;
                                  if (result == true) {
                                    var isSelectedLocation;
                                    if (isSelected1 == true) {
                                      isSelectedLocation = "Home";
                                    }
                                    if (isSelected2 == true) {
                                      isSelectedLocation = "Office";
                                    }
                                    if (isSelected3 == true) {
                                      isSelectedLocation = "Other";
                                    }

                                    var auth = FirebaseFirestore.instance
                                        .collection("allUser");
                                    Map data = {
                                      "folorNumber": _folorNumber.text,
                                      "phoneNumber": _phoneNumber.text,
                                      "pincode": _pincode.text,
                                      "recipientName": _recipientName.text,
                                      "type": isSelectedLocation
                                    };

                                    auth.doc(userNumber).set({"address": data},
                                        SetOptions(merge: true)).then((value) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BoxSaveData();
                                          });
                                    });
                                    if (widget.isListPasrse == true) {
                                      print(
                                          "---------${widget.myFileNameList}");
                                      print("---------${widget.myList}");
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HowToProcess(
                                                      myFileNameList:
                                                          widget.myFileNameList,
                                                      myList: widget.myList)));
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ShowInternetBox();
                                        });
                                  }
                                }
                              },
                              mycolors: AppComponent.Green),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
