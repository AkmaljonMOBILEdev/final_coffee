import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../../../utils/size_extensions.dart';

class OnBoardingLogo extends StatelessWidget {
  const OnBoardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: editW(345),
      height: editH(345),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white
      ),
      child: Image.asset(AppIcons.splashLogo),
    );
  }
}
