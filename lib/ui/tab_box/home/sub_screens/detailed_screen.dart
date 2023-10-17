import 'package:final_coffee/cubits/coffee/coffee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/models/coffee_model/coffee_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/size_extensions.dart';
import '../../../widgets/global_button.dart';

class CoffeeDetailedScreen extends StatelessWidget {
  const CoffeeDetailedScreen({super.key, required this.coffeeModel});

  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c583732,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            )),
      ),
      body: BlocBuilder<CoffeeCubit, CoffeeState>(
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.c583732,
                AppColors.c583732.withOpacity(.71),
              ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: editH(160),
                    width: editW(140),
                    child: FadeInImage.assetNetwork(
                      placeholder: AppIcons.no,
                      // Path to your placeholder image
                      image: coffeeModel.image,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 300),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: AppColors.c583732,
                          borderRadius: BorderRadius.circular(50.r)),
                      height: editH(320),
                      width: editW(320),
                      child: Image.network(
                        coffeeModel.image,
                        fit: BoxFit.contain,
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: (height / 1.68).h,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 36.h, bottom: 12.h),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.r),
                          topLeft: Radius.circular(50.r),
                        )),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.c583732,
                                        borderRadius:
                                            BorderRadius.circular(50.r)),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(AppIcons.star),
                                        12.pw,
                                        Text(
                                          "4.5",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    overflow: TextOverflow.clip,
                                    text: TextSpan(
                                      text: "UZS  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color: const Color(0xFF335c67),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.sp),
                                      children: [
                                        TextSpan(
                                          text: coffeeModel.price
                                                      .toString()
                                                      .length >
                                                  6
                                              ? coffeeModel.price
                                                  .toString()
                                                  .substring(0, 7)
                                              : coffeeModel.price.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF008000),
                                                  fontSize: 26.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              16.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    coffeeModel.name.length > 10
                                        ? coffeeModel.name.substring(0, 10)
                                        : coffeeModel.name,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                coffeeModel.name.length > 6
                                                    ? 25.sp
                                                    : 28.sp),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (coffeeModel.count > 0) {

                                            }
                                          },
                                          icon: SvgPicture.asset(
                                              AppIcons.remove)),
                                      Text(
                                        coffeeModel.count.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(color: AppColors.black),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                          },
                                          icon: SvgPicture.asset(AppIcons.add)),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                coffeeModel.description,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 6,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color:
                                            AppColors.c583732.withOpacity(.69)),
                              ),
                              24.ph,
                            ],
                          ),
                        ),
                        16.ph,
                        GlobalButton(title: "Add to Cart", onTap: () {})
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
