import 'package:final_coffee/data/models/coffee_model/coffee_model.dart';
import 'package:final_coffee/data/network/user_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:final_coffee/ui/tab_box/cart/widgets/cart_item_holder.dart';
import 'package:final_coffee/ui/tab_box/profile/widgets/edit.dart';
import 'package:final_coffee/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/tab/tab_cubit.dart';
import '../../../data/models/coffee_model/fake_data.dart';
import '../../widgets/global_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("2 items in Cart"),
        ),
        body: StreamBuilder<List<CoffeeModel>>(
          stream: getIt.get<FirebaseRepository>().getOrders(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final orderedList = snapshot.data;
              return Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemHolder(
                            coffeeModel: orderedList![index],
                            onAdd: () {
                              // context.read<UserCubit>().updateUserFields(fieldKey: UserFieldKeys.list, value: state.userModel.orderedList.add(state.userModel.orderedList.first));
                            },
                            onCancel: () {},
                            onRemove: () {},
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 16.ph;
                        },
                        itemCount: snapshot.data!.length,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            RichText(
                              overflow: TextOverflow.clip,
                              text: TextSpan(
                                text: "UZS  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                    color: const Color(0xFF335c67),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
                                children: [
                                  TextSpan(
                                    text: (fakeProducts[1].price +
                                        fakeProducts[6].price)
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: const Color(0xFF008000)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        6.ph,
                        GlobalButton(
                          title: "Checkout",
                          onTap: () {
                            showEditProfileDialog(context);
                          },
                        ),
                        context.watch<TabCubit>().state.isAdmin
                            ? SizedBox(
                          height: 48.h,
                        )
                            : TextButton(
                            onPressed: () {
                              context.read<TabCubit>().changeTabIndex(0);
                            },
                            child: Text(
                              "Back to Menu",
                              style: Theme.of(context).textTheme.titleSmall,
                            ))
                      ],
                    ),
                  )
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                      "No items in cart.")); // Show a message if there are no items
            }
            return const SizedBox();

          },
        ));
  }
}
