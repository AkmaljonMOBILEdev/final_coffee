import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';

class ProfileMainWidgets extends StatelessWidget {
  const ProfileMainWidgets({
    super.key,
    required this.title,
    required this.onTap, 
    required this.icon,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
             splashColor: AppColors.c421E1E.withOpacity(.4),
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.c583732.withOpacity(.18)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(icon),
              18.pw,
              Text(title, style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
        ),
      ),
    );
  }
}
