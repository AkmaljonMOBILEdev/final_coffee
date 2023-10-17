import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/size_extensions.dart';

class CoffeeTypeHolder extends StatelessWidget {
  const CoffeeTypeHolder({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String image;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.c421E1E,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected?AppColors.c583732:AppColors.cD9D9D9,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: SizedBox(
                  width: editW(50),
                  height: editH(50),
                  child: Image.asset(image)),
            ),
          ),
          Text(title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isSelected?AppColors.c583732:AppColors.c583732.withOpacity(.86)
          ),)
        ],
      ),
    );
  }
}
