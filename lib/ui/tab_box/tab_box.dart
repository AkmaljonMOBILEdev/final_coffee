import 'package:final_coffee/ui/tab_box/profile/profile_screen.dart';
import 'package:final_coffee/ui/tab_box/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../cubits/tab/tab_cubit.dart';
import '../../cubits/tab/tab_state.dart';
import '../../data/local/storage_repository/storage_repository.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../app_routes.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabCubit, TabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: context.watch<TabCubit>().state.index,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              _getItem(icon: AppIcons.home),
              _getItem(icon: AppIcons.search),
              _getItem(icon: AppIcons.cart),
              _getItem(icon: AppIcons.profile),
            ],
            currentIndex: context.watch<TabCubit>().state.index,
            onTap: context.read<TabCubit>().changeTabIndex,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: state.isAdmin
              ? Padding(
                padding:  EdgeInsets.only(bottom: 24.h),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.add);
                    },
                    backgroundColor: AppColors.c008000,
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                      size: 36,
                    ),
                  ),
              )
              : const SizedBox(),
        );
      },
    );
  }

  BottomNavigationBarItem _getItem({
    required String icon,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        icon,
        width: 36.w,
        height: 36.h,
        colorFilter: const ColorFilter.mode(
          AppColors.c531607,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
        width: 32.w,
        height: 32.h,
        colorFilter: const ColorFilter.mode(
          AppColors.c8F8787,
          BlendMode.srcIn,
        ),
      ),
      label: "",
    );
  }
}
