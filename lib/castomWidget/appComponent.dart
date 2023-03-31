import 'package:flutter/material.dart';
import 'package:generic_medicine/login/login.dart';

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
  static String introLogo = "img/introLogo.png";
  static String lineArrow = "img/lineArrow.png";
  static String logo = "img/logo.png";

  static String login = "img/login/login.png";
  static String singUp = "img/login/singUp.png";
  static String singlLogo = "img/singlLogo.png";
  static String otp = "img/login/otp.png";

  static String introOne = "img/introScreen/introOne.png";
  static String groupOne = "img/introScreen/groupOne.png";
  static String groupTwo = "img/introScreen/groupTwo.png";

  static String india = "img/home/india.png";
  static String profile = "img/home/profile.png";
  static String home = "img/home/home.png";
  static String cancel = "img/home/cancel.png";
  static String photo = "img/home/photo.png";
  static String gallery = "img/home/gallery.png";
  static String prescription = "img/home/prescription.png";
  static String arrowRight = "img/home/arrowRight.png";
  static String rightSite = "img/home/rightSite.png";
  static String tickmark = "img/home/tickmark.png";
  static String flash = "img/home/flash.png";
  static String taskOne = "img/home/taskOne.png";
  static String taskTwo = "img/home/taskTwo.png";
  static String taskThree = "img/home/taskThree.png";
  static String homeAddress = "img/home/homeAddress.png";
  static String process = "img/home/process.png";
  static String doctor = "img/home/doctor.png";
  static String whatsapp = "img/home/whatsapp.png";
  static String internet = "img/home/Internet.png";
  static String valid = "img/home/valid.png";

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
