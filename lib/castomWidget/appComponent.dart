import 'package:flutter/material.dart';
import 'package:generic_medicine/login/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppComponent {
  // colors
  static Color White = Color.fromARGB(255, 245, 244, 240);
  static Color NevyBlue = Color.fromARGB(255, 0, 56, 101);
  static Color Blue = Color.fromARGB(255, 0, 139, 197);
  static Color Green = Color.fromARGB(255, 1, 149, 98);
  static Color Orange = Color.fromARGB(255, 234, 132, 35);
  static Color red = Color.fromARGB(255, 156, 23, 21);

//Images
  // Logo
  static String introLogo = "img/introLogo.svg";
  static String lineArrow = "img/lineArrow.svg";
  static String logo = "img/logo.svg";

  static String login = "img/login/login.svg";
  static String singUp = "img/login/singUp.svg";
  static String singlLogo = "img/singlLogo.svg";
  static String otp = "img/login/otp.svg";

  static String introOne = "img/introScreen/introOne.png";
  static String groupOne = "img/introScreen/groupOne.svg";
  static String groupTwo = "img/introScreen/groupTwo.svg";
  static String groupOnePage = "img/introScreen/groupOnePage.svg";
  static String groupTwoPage = "img/introScreen/groupTwoPage.svg";

  static String india = "img/home/india.svg";
  static String profile = "img/home/profile.svg";
  static String home = "img/home/home.svg";
  static String cancel = "img/home/cancel.svg";
  static String photo = "img/home/photo.svg";
  static String gallery = "img/home/gallery.svg";
  static String prescription = "img/home/prescription.svg";
  static String arrowRight = "img/home/arrowRight.svg";
  static String rightSite = "img/home/rightSite.png";
  static String tickmark = "img/home/tickmark.svg";
  static String flash = "img/home/flash.svg";
  static String taskOne = "img/home/taskOne.svg";
  static String taskTwo = "img/home/taskTwo.svg";
  static String taskThree = "img/home/taskThree.svg";
  static String homeAddress = "img/home/homeAddress.svg";
  static String process = "img/home/process.png";
  static String doctor = "img/home/doctor.png";
  static String whatsapp = "img/home/whatsapp.svg";
  static String internet = "img/home/Internet.png";
  static String valid = "img/home/valid.svg";

  static const String loginPage = "/loginPage";
  static const String singUpPage = "/singUpPage";

  static const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  static final regex = RegExp(pattern);
}
