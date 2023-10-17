import 'dart:async';
import 'dart:math';
import 'package:final_coffee/cubits/user/user_cubit.dart';
import 'package:final_coffee/data/local/storage_repository/storage_repository.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/icons.dart';
import '../app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1;
      });
    });
    navigateToApp();
  }

  fakeSign(){
    passwordUser = "12${Random().nextInt(500)}asda45";
    signInOnUPUser = "a${DateTime.now()}@gmail.com";
  }



  void navigateToApp() async {
    if(StorageRepository.getBool("keyA")!=true){
      fakeSign();
      context.read<UserCubit>().signUpFake();
      StorageRepository.putBool("keyA", true);

    }
    await Future.delayed(const Duration(seconds: 6));
    if(context.mounted) context.read<UserCubit>().loginFake();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, FirebaseAuth.instance.currentUser==null?RouteNames.onBoarding:RouteNames.onBoarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            50.ph,
            Lottie.asset(AppIcons.splashLottie),
            AnimatedOpacity(
                opacity: opacity,
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 1700),
                child: Text(
                  "Drink & enjoy!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.c531607),
                )),
          ],
        ),
      ),
    );
  }
}
