import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/size_extensions.dart';

class PromotionHolder extends StatelessWidget {
  const PromotionHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 24.w),
            child: Text(
              "Promotion",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.c583732, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 48.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                colors: [
                  AppColors.c583732.withOpacity(.7),
                  AppColors.c583732.withOpacity(.49)
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's offer",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp),
                    ),
                    4.ph,
                    Text(
                      "Free Bottle Of Coffee Latte",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w700,
                          fontSize: 15.sp
                      ),
                    ),
                    Text(
                      "on all orders above 200.000 UZS",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp
                      ),
                    ),
                  ],
                ),
                SizedBox()
              ],
            ),
          )
        ],
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding:  EdgeInsets.only(right: 4.w),
          child: Image.asset(AppIcons.customCoffee, width: editW(124),height: editH(194),),
        ),
      )
    ],);
  }
}
