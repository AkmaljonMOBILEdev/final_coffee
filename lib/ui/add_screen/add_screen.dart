import 'package:final_coffee/ui/add_screen/widgets/images_view.dart';
import 'package:final_coffee/ui/add_screen/widgets/type_selector.dart';
import 'package:final_coffee/ui/add_screen/widgets/uploaded_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../cubits/coffee/coffee_cubit.dart';
import '../../data/models/coffee_model/coffee_field_keys.dart';
import '../../utils/colors.dart';
import '../../utils/size_extensions.dart';
import '../widgets/global_button.dart';
import '../widgets/text_field.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  ImagePicker picker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController count = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<CoffeeCubit>().updateCoffeeFields(fieldKey: CoffeeFieldKeys.image, value: "");
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text("Add Coffees"),
      ),
      body: BlocBuilder<CoffeeCubit, CoffeeState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: ()async{
              context.read<CoffeeCubit>().updateCoffeeFields(fieldKey: CoffeeFieldKeys.image, value: "");
              return true;
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      children: [
                        GlobalTextField(
                          hintText: "Coffee name",
                          controller: name,
                          onChanged: (v) {
                            if (v.isNotEmpty) {
                              context.read<CoffeeCubit>().updateCoffeeFields(
                                  fieldKey: CoffeeFieldKeys.name, value: v);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Give a name for coffee")));
                            }
                          },
                        ),
                        SizedBox(
                            height: editH(200),
                            child: GlobalTextField(
                              hintText: "Description",
                              controller: desc,
                              onChanged: (v) {
                                context.read<CoffeeCubit>().updateCoffeeFields(
                                    fieldKey: CoffeeFieldKeys.desc, value: v);
                              },
                              isInstruction: true,
                            )),
                        GlobalTextField(
                          hintText: "Price",
                          controller: price,
                          isNum: true,
                          onChanged: (v) {
                            if (int.parse(v) > 0) {
                              context.read<CoffeeCubit>().updateCoffeeFields(
                                  fieldKey: CoffeeFieldKeys.price,
                                  value: int.parse(v));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Give a price for coffee")));
                            }
                          },
                        ),
                        GlobalTextField(
                          hintText: "Count",
                          controller: count,
                          isNum: true,
                          isLast: true,
                          onChanged: (v) {
                            if (int.parse(v) > 0) {
                              context.read<CoffeeCubit>().updateCoffeeFields(
                                  fieldKey: CoffeeFieldKeys.count,
                                  value: int.parse(v));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Give a count for coffee")));
                            }
                          },
                        ),
                        const TypeSelectorWidget(),
                        state.coffeeModel.image.isEmpty?ImagesForAddScreen(
                          onOpen: () {
                            showBottomSheetDialog();
                          },
                        ):UploadedImageView(
                            onRemove: (){
                              context.read<CoffeeCubit>().updateCoffeeFields(fieldKey: CoffeeFieldKeys.image, value: "");
                            },
                            path: state.coffeeModel.image),

                      ],
                    ),
                  ),
                  18.ph,
                  GlobalButton(
                    title: "Add",
                    onTap: () {
                      context.read<CoffeeCubit>().addCoffee(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.cACA4A4,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null && context.mounted) {
      context.read<CoffeeCubit>().uploadImage(context, xFile);
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
    );

    if (xFile != null && context.mounted) {
      context.read<CoffeeCubit>().uploadImage(context, xFile);
    }
  }

  @override
  void dispose() {
    name.dispose();
    desc.dispose();
    price.dispose();
    count.dispose();
    super.dispose();
  }
}
