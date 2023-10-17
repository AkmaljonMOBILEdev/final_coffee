import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../data/models/coffee_model/coffee_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/size_extensions.dart';

class CartItemHolder extends StatelessWidget {
  const CartItemHolder({
    super.key,
    required this.coffeeModel,
    required this.onAdd,
    required this.onRemove,
    required this.onCancel,
  });

  final CoffeeModel coffeeModel;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(colors: [
                    AppColors.c583732.withOpacity(0),
                    AppColors.c583732.withOpacity(.49)
                  ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
              child: SizedBox(
                height: editH(110),
                width: editW(100),
                child: Image.asset(
                  coffeeModel.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            16.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  coffeeModel.name.length > 8
                      ? coffeeModel.name.substring(0, 8)
                      : coffeeModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16.sp),
                ),
                RichText(
                  overflow: TextOverflow.clip,
                  text: TextSpan(
                    text: "UZS  ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xFF335c67),
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: coffeeModel.price.toString().length > 6
                            ? coffeeModel.price.toString().substring(0, 7)
                            : coffeeModel.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: const Color(0xFF008000),
                              fontSize: 17.sp,
                            ),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppIcons.remove,
                          width: 32.w,
                          height: 32.h,
                        )),
                    Text(
                      "1",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.black),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppIcons.add,
                          width: 32.w,
                          height: 32.h,
                        )),
                  ],
                )
              ],
            ),
            const Spacer(),
          ],
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: onCancel,
                icon: SvgPicture.asset(
                  AppIcons.cancel,
                  width: 32.w,
                  height: 32.h,
                  colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ))),
      ],
    );
  }
}
