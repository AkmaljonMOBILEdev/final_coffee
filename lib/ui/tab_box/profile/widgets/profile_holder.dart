import 'package:final_coffee/data/models/user_model/user_model.dart';
import 'package:final_coffee/utils/colors.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFieldHolder extends StatelessWidget {
  const ProfileFieldHolder({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      height: editH(65),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: AppColors.c583732.withOpacity(.18),
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
