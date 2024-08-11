import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_2024/theme.dart';
import 'package:suitmedia_mobiledev_2024/views/components/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
  });

  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: kWhite,
            backgroundColor: kBlue,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 1,
          ),
          child: Text(text!, style: textStyles(14, kWhite, FontWeight.normal)),
        ),
      ),
    );
  }
}
