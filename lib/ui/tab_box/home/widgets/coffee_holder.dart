import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/models/coffee_model/coffee_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/size_extensions.dart';

class CoffeeHolder extends StatelessWidget {
  const CoffeeHolder({super.key, required this.coffeeModel, required this.onAdd, required this.onMove});
  final VoidCallback onAdd;
  final VoidCallback onMove;
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: coffeeModel,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onMove,
          borderRadius: BorderRadius.circular(20.r),
          splashColor: AppColors.c421E1E.withOpacity(.4),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(colors: [
                  AppColors.c583732.withOpacity(.07),
                  AppColors.c583732.withOpacity(.19)
                ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: editH(160),
                  width: editW(140),
                  child: FadeInImage.assetNetwork(
                    placeholder: AppIcons.no,  // Path to your placeholder image
                    image: coffeeModel.image,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 300),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coffeeModel.name.length>12?coffeeModel.name.substring(0,12):coffeeModel.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 15.sp
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        RichText(
                          overflow: TextOverflow.clip,
                          text: TextSpan(
                            text: "UZS  ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: const Color(0xFF335c67), fontWeight: FontWeight.w700, fontSize: 15.sp),
                            children: [
                              TextSpan(
                                text: coffeeModel.price.toString().length>6?coffeeModel.price.toString().substring(0,7):coffeeModel.price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: const Color(0xFF008000)),
                              )
                            ],
                          ),
                        ),
                        ZoomTapAnimation(
                            onTap: onAdd,
                            child: SvgPicture.asset(AppIcons.addBox, width: 28.w, height: 28.h,))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
