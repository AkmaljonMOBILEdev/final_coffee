import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/size_extensions.dart';

class GlobalTextField extends StatelessWidget {
  GlobalTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.isLast = false,
    this.isInstruction = false,
    this.isNum = false,
    this.controller,
  });

  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isLast;
  final bool isInstruction;
  final bool isNum;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: editH(65),
      margin: EdgeInsets.only(bottom: 16.h),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: !isNum?TextInputType.text:TextInputType.number,
        inputFormatters: [
          if(isNum) FilteringTextInputFormatter.digitsOnly
        ],
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        style: Theme.of(context).textTheme.titleSmall,
        maxLines: isInstruction ? 10 : 1,
        maxLength: !isInstruction?20:1000,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.cACA4A4),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: AppColors.c583732.withOpacity(.5), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: AppColors.c583732, width: 1.w),
          ),
        ),
      ),
    );
  }
}
