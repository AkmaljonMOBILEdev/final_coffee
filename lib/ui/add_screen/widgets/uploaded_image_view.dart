import 'package:final_coffee/utils/colors.dart';
import 'package:final_coffee/utils/icons.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadedImageView extends StatelessWidget {
  const UploadedImageView(
      {super.key, required this.path, required this.onRemove});

  final String path;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          height: editH(400),
          width: editW(360),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.c008000, width: 1.w)),
          child: Image.network(
            path,
            fit: BoxFit.contain,
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: onRemove,
                icon: SvgPicture.asset(
                  AppIcons.cancel,
                  width: editW(40),
                  height: editH(40),
                  colorFilter:
                      const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                )))
      ],
    );
  }
}
