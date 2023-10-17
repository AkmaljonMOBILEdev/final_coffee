import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50.r),
        splashColor: AppColors.c421E1E.withOpacity(.4),
        child: Container(
          margin: EdgeInsets.all(18.w),
          padding: EdgeInsets.all(10.w),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cACA4A4
          ),
          child: SvgPicture.asset(AppIcons.admin,),
        ),
      ),
    );
  }
}
