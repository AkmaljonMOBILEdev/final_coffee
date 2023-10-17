import 'package:final_coffee/ui/tab_box/cart/widgets/button.dart';
import 'package:final_coffee/ui/widgets/global_button.dart';
import 'package:final_coffee/utils/colors.dart';
import 'package:final_coffee/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_coffee/cubits/user/user_cubit.dart';
import '../../../../data/models/user_model/user_field_keys.dart';
import '../../../widgets/text_field.dart';

class EditProfileDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalTextField(
            controller: nameController,
            hintText: "Your name",
            onChanged: (v) {
              if (v.isNotEmpty) {
                context.read<UserCubit>().updateUserFields(
                    fieldKey: UserFieldKeys.name, value: v);
              }
            },
          ),
          GlobalTextField(
            controller: phoneController,
            hintText: "Your phone number",
            onChanged: (v) {
              if (v.isNotEmpty) {
                context.read<UserCubit>().updateUserFields(
                    fieldKey: UserFieldKeys.phone, value: v);
              }
            },
          ),
          GlobalTextField(
            controller: addressController,
            hintText: "Your address",
            isLast: true,
            onChanged: (v) {
              if (v.isNotEmpty) {
                context.read<UserCubit>().updateUserFields(
                    fieldKey: UserFieldKeys.address, value: v);
              }
            },
          ),
        ],
      ),
      actions: [
        CartDialogButton(title: "Save", onTap: (){
          showLoading(context: context);
          context.read<UserCubit>().signFakeUser(context);
          if(context.mounted) hideLoading(context: context);
          Navigator.pop(context);
        }),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without saving
          },
          child: const Text("Cancel", style: TextStyle(color: AppColors.c583732),),
        ),
      ],
    );
  }
}

// To show the dialog, you can use the following code:

// onPressed of a button or any other event where you want to show the dialog
void showEditProfileDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return EditProfileDialog();
    },
  );
}
