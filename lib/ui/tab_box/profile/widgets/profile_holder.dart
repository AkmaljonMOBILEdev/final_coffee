import 'package:final_coffee/data/models/user_model/user_model.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFieldHolder extends StatelessWidget {
  const ProfileFieldHolder({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: editH(65),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
