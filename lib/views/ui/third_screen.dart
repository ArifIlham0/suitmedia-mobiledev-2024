import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobiledev_2024/controllers/palindrome_provider.dart';
import 'package:suitmedia_mobiledev_2024/theme.dart';
import 'package:suitmedia_mobiledev_2024/views/components/exports.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<PalindromeProvider>(context, listen: false);
    provider.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PalindromeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Third Screen",
              style: textStyles(16, kBlack, FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: provider.usersList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final user = provider.usersList[index];
                      return InkWell(
                        onTap: () {
                          provider.setUsername =
                              "${user.firstName} ${user.lastName}";
                        },
                        child: ListUser(users: user),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
