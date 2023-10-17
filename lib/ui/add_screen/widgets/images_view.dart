import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/icons.dart';
import '../../../utils/size_extensions.dart';

class ImagesForAddScreen extends StatefulWidget {
  const ImagesForAddScreen({super.key, required this.onOpen});
  final VoidCallback onOpen;

  @override
  State<ImagesForAddScreen> createState() => _ImagesForAddScreenState();
}

class _ImagesForAddScreenState extends State<ImagesForAddScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onOpen,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20.r),
          // border: Border.all(
          //   // color: AppColors.c583732,
          //   width: 1.w
          // ),
        ),
        child: Column(
          children: [
            SizedBox(
                height: editH(200),
                width: editW(200),
                child: Lottie.asset(AppIcons.addImage)),
            Text("Upload an image", style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
      ),
    );
  }
}
