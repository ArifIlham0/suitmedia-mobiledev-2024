import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiledev_2024/controllers/palindrome_provider.dart';
import 'package:suitmedia_mobiledev_2024/theme.dart';
import 'package:suitmedia_mobiledev_2024/views/components/exports.dart';
import 'package:suitmedia_mobiledev_2024/views/ui/exports.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PalindromeProvider>(
      builder: (context, provider, child) {
        print(provider.username);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Second Screen",
              style: textStyles(16, kBlack, FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: textStyles(13, kBlack, FontWeight.normal),
                ),
                Text(
                  provider.name,
                  style: textStyles(17, kBlack, FontWeight.w600),
                ),
                HeightSpacer(height: 220),
                Center(
                  child: Text(
                    provider.username,
                    style: textStyles(22, kBlack, FontWeight.w600),
                  ),
                ),
                HeightSpacer(height: 280),
                CustomButton(
                  text: "Choose a User",
                  onPressed: () {
                    Get.to(
                      () => ThirdScreen(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 100),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
