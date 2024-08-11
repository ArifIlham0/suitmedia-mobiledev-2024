import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiledev_2024/controllers/palindrome_provider.dart';
import 'package:suitmedia_mobiledev_2024/theme.dart';
import 'package:suitmedia_mobiledev_2024/views/components/exports.dart';
import 'package:suitmedia_mobiledev_2024/views/ui/exports.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController palindrome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PalindromeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/images/background.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: Form(
                  key: provider.palindromeKey,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/profile.png",
                            height: 200.h,
                          ),
                          CustomTextField(
                            labelText: "Name",
                            keyboardType: TextInputType.text,
                            controller: name,
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "Tolong masukkan nama";
                              } else {
                                return null;
                              }
                            },
                          ),
                          HeightSpacer(height: 20),
                          CustomTextField(
                            labelText: "Palindrome",
                            keyboardType: TextInputType.text,
                            controller: palindrome,
                            validator: (palindrome) {
                              if (palindrome!.isEmpty) {
                                return "Tolong masukkan kalimat palindrome";
                              } else {
                                return null;
                              }
                            },
                          ),
                          HeightSpacer(height: 50),
                          CustomButton(
                            text: "CHECK",
                            onPressed: () {
                              if (palindrome.text.isNotEmpty) {
                                provider.setInput(palindrome.text);
                                provider.checkPalindrome();
                                dialog(provider);
                              }
                            },
                          ),
                          HeightSpacer(height: 20),
                          CustomButton(
                            text: "NEXT",
                            onPressed: () {
                              if (provider.validateAndSave()) {
                                provider.name = name.text;
                                provider.setInput(palindrome.text);
                                provider.checkPalindrome();
                                if (provider.output ==
                                    'Yes, it is a palindrome') {
                                  Get.to(
                                    () => SecondScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(milliseconds: 100),
                                  );
                                } else {
                                  dialog(provider);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> dialog(PalindromeProvider provider) {
    return Get.dialog(
      AlertDialog(
        elevation: 0.0,
        content: Text(
          provider.output,
          style: textStyles(12, kBlack, FontWeight.normal),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
