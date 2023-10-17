import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';


class CartDialogButton extends StatelessWidget {
  const CartDialogButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isOnBoard = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isOnBoard;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50.r),
      color: isOnBoard ? AppColors.white : AppColors.c583732,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50.r),
        splashColor: isOnBoard?AppColors.c421E1E.withOpacity(.4):AppColors.c421E1E,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 6.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isOnBoard ? AppColors.c583732 : AppColors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
