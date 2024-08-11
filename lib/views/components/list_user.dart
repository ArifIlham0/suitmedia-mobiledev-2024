import 'package:flutter/material.dart';
import 'package:suitmedia_mobiledev_2024/models/user_model.dart';
import 'package:suitmedia_mobiledev_2024/theme.dart';
import 'package:suitmedia_mobiledev_2024/views/components/exports.dart';

class ListUser extends StatelessWidget {
  const ListUser({
    super.key,
    this.users,
  });

  final Datum? users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  users!.avatar!,
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              WidthSpacer(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${users?.firstName!} ${users?.lastName!}",
                    style: textStyles(16, kBlack, FontWeight.w500),
                  ),
                  HeightSpacer(height: 5),
                  Text(
                    users!.email!,
                    style: textStyles(11, kGrey, FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          HeightSpacer(height: 10),
          Divider(color: kGrey, thickness: 0.5)
        ],
      ),
    );
  }
}
