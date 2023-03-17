import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine/castomWidget/appComponent.dart';

class FullButton extends StatelessWidget {
  late final String title;
  late final VoidCallback onPressed;
  late final bool loading;

  FullButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppComponent.Green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.85))),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(fontSize: 20.h),
                ),
        ),
      ),
    );
  }
}
