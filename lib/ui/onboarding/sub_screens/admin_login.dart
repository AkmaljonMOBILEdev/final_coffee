import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/tab/tab_cubit.dart';
import '../../../cubits/user/user_cubit.dart';
import '../../../utils/constants.dart';
import '../../app_routes.dart';
import '../../widgets/global_button.dart';
import '../../widgets/text_field.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  String loginHolder = "";
  String passwordHolder = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text("Login as admin"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              children: [
                GlobalTextField(
                  hintText: "Login",
                  onChanged: (v) {
                    setState(() {
                      loginHolder = v;
                    });
                  },
                ),
                GlobalTextField(
                  hintText: "Password",
                  onChanged: (v) {
                    setState(() {
                      passwordHolder = v;
                    });
                  },
                ),
              ],
            )),
            GlobalButton(
              title: "Login",
              onTap: () {
                // if(FirebaseAuth.instance.currentUser==null){
                //   context.read<UserCubit>().signFakeUser(context);
                // }else{
                //   context.read<UserCubit>().loginFake();
                // }


                if(loginHolder==loginForAdmin){
                  if(passwordHolder==passwordForAdmin){
                    context.read<TabCubit>().changeAdmin(true);
                    context.read<TabCubit>().changeTabIndex(0);
                    Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password is incorrect!")));
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login is incorrect!")));

                }
              },
            )
          ],
        ),
      ),
    );
  }
}
