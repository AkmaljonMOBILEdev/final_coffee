import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/icons.dart';

class SearcherWidget extends StatelessWidget {
  const SearcherWidget({super.key, required this.onSearch});
  final VoidCallback onSearch;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSearch,
      child: Container(
        margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 28.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.cEFEEEE,
          borderRadius: BorderRadius.circular(30.r)
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.search, width: 32.w, height: 32.h,),
            10.pw,
            Text("Search...", style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.cACA4A4
            ),)
          ],
        ),
      ),
    );
  }
}
