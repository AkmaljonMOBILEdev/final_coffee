import 'package:final_coffee/utils/colors.dart';
import 'package:final_coffee/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onSearch});

  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.c008000,
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        onTap: onSearch,
        borderRadius: BorderRadius.circular(20.r),
        splashColor: AppColors.white.withOpacity(.7),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: SvgPicture.asset(
            AppIcons.search,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
