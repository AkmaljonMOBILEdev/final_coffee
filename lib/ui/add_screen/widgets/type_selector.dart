import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubits/coffee/coffee_cubit.dart';
import '../../../data/models/coffee_model/coffee_field_keys.dart';
import '../../../data/models/coffee_model/coffee_types.dart';
import '../../../utils/colors.dart';


class TypeSelectorWidget extends StatefulWidget {
  const TypeSelectorWidget({super.key});

  @override
  State<TypeSelectorWidget> createState() => _TypeSelectorWidgetState();
}

class _TypeSelectorWidgetState extends State<TypeSelectorWidget> {
  CoffeeTypes selectedCoffee = CoffeeTypes.americano;
  String chosenCoffee = "Americano";
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select type", style: Theme.of(context).textTheme.titleMedium,),
        Container(
          margin: EdgeInsets.only(top:8.h,bottom: 24.h),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.c583732,
              width: 1.w
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<CoffeeTypes>(
                // isExpanded: true,
                // icon: SizedBox(),
                underline: SizedBox(),
                value: selectedCoffee,
                items: CoffeeTypes.values.map((CoffeeTypes coffeeType) {
                  return DropdownMenuItem<CoffeeTypes>(
                    value: coffeeType,
                    child: Text(coffeeType.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (CoffeeTypes? value) {
                  setState(() {
                    selectedCoffee = value!;
                    chosenCoffee = ((value.toString().split(".").last)[0].toUpperCase())+value.toString().split(".").last.substring(1);
                    context.read<CoffeeCubit>().updateCoffeeFields(fieldKey: CoffeeFieldKeys.type, value: chosenCoffee);

                  });
                },
              ),
              SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}
