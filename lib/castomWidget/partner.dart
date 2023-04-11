import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/BocSaveData.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';
import 'package:generic_medicine/castomWidget/appbar.dart';
import 'package:generic_medicine/castomWidget/fullButtom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine/castomWidget/widget.dart';
import 'package:generic_medicine/uploadPrescription.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Partner extends StatefulWidget {
  const Partner({super.key});

  @override
  State<Partner> createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _residence = TextEditingController();
  TextEditingController _shop = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _country = TextEditingController();
  bool isWhatsapp = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: MyAppBar().myappwithLogo(context),
          body: Container(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(30.h, 10.h, 30.h, 0.h),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25.sp,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child:
                                      SvgPicture.asset(AppComponent.lineArrow),
                                )),
                          ),
                          SizedBox(
                            width: 20.sp,
                          ),
                          Text(
                            "Fill-up all details",
                            style: TextStyle(
                                color: AppComponent.NevyBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: _form,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.h, 15.h, 30.h, 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                form("Full name", _name, "Name"),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 139, 139, 139)),
                                ),
                                TextFormField(
                                  controller: _number,
                                  cursorColor: AppComponent.Green,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      width: 80.w,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(AppComponent.india),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          const Text(
                                            "+ 91",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.h, 0.h, 15.h, 0.h),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.sp)),
                                      value: isWhatsapp,
                                      onChanged: (value) {
                                        setState(() {
                                          isWhatsapp = value!;
                                        });
                                      }),
                                ),
                                Text(
                                  "Will be used in",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(AppComponent.whatsapp)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.h, 0.h, 30.h, 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                form("Email", _email, "Email ID", email: true),
                                SizedBox(
                                  height: 5.h,
                                ),
                                form("Address shop", _shop, "shop"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                form("City", _city, "City"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                form("Country", _country, "Country"),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.h, 0.h, 30.h, 30.h),
                            child: FullButton(
                                title: "Submit",
                                loading: loading,
                                onPressed: () async {
                                  if (_form.currentState!.validate()) {
                                    bool result =
                                        await InternetConnectionChecker()
                                            .hasConnection;
                                    if (result == true) {
                                      setState(() {
                                        loading = true;
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("allpartner")
                                          .doc("+91" + _number.text)
                                          .set({
                                        "name": _name.text,
                                        "number": _number.text,
                                        "email": _email.text,
                                        "address": _shop.text,
                                        "city": _city.text,
                                        "isWhatsapp": isWhatsapp,
                                        "country": _country.text,
                                      }, SetOptions(merge: true));
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BoxSaveData();
                                          });
                                      setState(() {
                                        loading = false;
                                      });
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
      ),
    );
  }

  Widget form(String title, TextEditingController myController, String error,
      {bool email = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 139, 139, 139)),
        ),
        SizedBox(
          height: 55.h,
          child: TextFormField(
            controller: myController,
            keyboardType: TextInputType.name,
            cursorColor: AppComponent.Green,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppComponent.Green),
              ),
            ),
            validator: (value) {
              if (value == "") {
                return "Enter Your $error";
              }
              if (email == true) {
                if (value!.isNotEmpty && !AppComponent.regex.hasMatch(value)) {
                  return "Enter a valid email address like @";
                }
              }
            },
          ),
        ),
        SizedBox(
          height: 0.h,
        ),
      ],
    );
  }
}
