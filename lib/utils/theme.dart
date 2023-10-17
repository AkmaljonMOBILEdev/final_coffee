import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.c531607),
    primaryColor: AppColors.c583732,
    hintColor: AppColors.cACA4A4,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.c583732,
        fontSize: 20.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      backgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.c583732),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    ),
    textTheme: TextTheme(
        //display
        displayLarge: TextStyle(
            color: AppColors.c583732,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800,
            fontFamily: 'Poppins'),
        displayMedium: TextStyle(
            color: AppColors.c583732,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'),
        displaySmall: TextStyle(
            color: AppColors.c583732,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
        //headline
        headlineLarge: TextStyle(
            color: AppColors.c583732,
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'),
        headlineMedium: TextStyle(
            color: AppColors.c583732,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        headlineSmall: TextStyle(
            color: AppColors.c583732,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins'),
        //title
        titleLarge: TextStyle(
            color: AppColors.c583732,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins'),
        titleMedium: TextStyle(
            color: AppColors.c583732,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
        titleSmall: TextStyle(
            color: AppColors.c583732,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        //label
        labelLarge: TextStyle(
            color: AppColors.c583732,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins'),
        labelMedium: TextStyle(
            color: AppColors.c583732,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        labelSmall: TextStyle(
            color: AppColors.c583732,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        //body
        bodyLarge: TextStyle(
            color: AppColors.c583732,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        bodyMedium: TextStyle(
            color: AppColors.c583732,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'),
        bodySmall: TextStyle(
            color: AppColors.c583732,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(
          color: AppColors.black,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.black,
          fontSize: 10.sp,
          fontStyle: FontStyle.normal,
          fontFamily: "Urbanist",
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.c531607,
          size: 24.w,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.c8F8787,
          size: 24.w,
        ),
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.c531607,
        unselectedItemColor: AppColors.c8F8787),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.cEFEEEE,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.cACA4A4,
        fontFamily: 'Poppins'
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
    ),


  );
}
