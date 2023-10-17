import 'package:final_coffee/ui/tab_box/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../cubits/user/user_cubit.dart';
import '../../../utils/icons.dart';
import '../../../utils/size_extensions.dart';
import '../../app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("You"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                children: [
                  SizedBox(
                    height: editH(180),
                    width: editW(140),
                    child: Lottie.asset(AppIcons.profileLottie),
                  ),
                  ProfileMainWidgets(
                    title: "Log out",
                    onTap: () {
                      context.read<UserCubit>().logOut();
                      Navigator.pushReplacementNamed(
                          context, RouteNames.onBoarding);
                    },
                    icon: AppIcons.logOut,
                  )
                ],
              )),
              48.ph
            ],
          ),
        ));
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
