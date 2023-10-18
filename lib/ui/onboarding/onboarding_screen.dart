import 'package:final_coffee/cubits/user/user_cubit.dart';
import 'package:final_coffee/ui/onboarding/widgets/admin_navigator.dart';
import 'package:final_coffee/ui/onboarding/widgets/logo.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:final_coffee/utils/ui_utils/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/tab/tab_cubit.dart';
import '../../utils/colors.dart';
import '../app_routes.dart';
import '../widgets/global_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.c421E1E,
              AppColors.c6D4934.withOpacity(.69),
            ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const OnBoardingLogo(),
                    Text(
                      "Welcome to",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontStyle: FontStyle.italic, color: AppColors.white),
                    ),
                    Text(
                      "Coffee Shop",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontStyle: FontStyle.italic, color: AppColors.white),
                    ),
                    32.ph,
                    GlobalButton(
                      title: "Get Started",
                      onTap: () {
                        context.read<TabCubit>().changeAdmin(false);
                        context.read<TabCubit>().changeTabIndex(0);

                        Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                        },
                      isOnBoard: true,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AdminButton(onTap: (){
                  // if(FirebaseAuth.instance.currentUser==null){
                  //   context.read<UserCubit>().signFakeUser();
                  // }else{
                  //   context.read<UserCubit>().loginFake();
                  // }
                  Navigator.pushNamed(context, RouteNames.adminLogin);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
