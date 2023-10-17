import 'package:equatable/equatable.dart';
import 'package:final_coffee/services/upload_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/models/coffee_model/coffee_field_keys.dart';
import '../../data/models/coffee_model/coffee_model.dart';
import '../../data/models/universal_data.dart';
import '../../data/network/user_repository.dart';
import '../../services/service_locator/service_locator.dart';
import '../../utils/ui_utils/loading_dialog.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit()
      : super(CoffeeState(
            coffeeModel: CoffeeModel(
                id: "id",
                name: "",
                description: "",
                price: 0,
                image: "",
                type: "",
                count: 0,
                isOrdered: false)));

  addCoffee(BuildContext context) async {
    showLoading(context: context);
    UniversalData data = await getIt
        .get<FirebaseRepository>()
        .addCoffee(coffeeModel: state.coffeeModel);
    if (context.mounted) hideLoading(context: context);
    if (data.data == "Coffee is added!") {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Successfully added!")));
        Navigator.pop(context);
      }
    }
  }

  uploadImage(BuildContext context, XFile xFile) async {
    showLoading(context: context);
    UniversalData data = await FileUploader.imageUploader(xFile);
    debugPrint("DB RASM: ${data.data}");
    if (context.mounted) hideLoading(context: context);
    if (data.error.isEmpty) {
      emit(state.copyWith(
          coffeeModel: state.coffeeModel.copyWith(image: data.data)));
      debugPrint("SQ RASM: ${state.coffeeModel.image}");
    }
  }



  updateCoffeeFields({
    required CoffeeFieldKeys fieldKey,
    required dynamic value,
  }) {
    CoffeeModel currentCoffee = state.coffeeModel;

    switch (fieldKey) {
      case CoffeeFieldKeys.name:
        {
          currentCoffee = currentCoffee.copyWith(name: value as String);
          break;
        }
      case CoffeeFieldKeys.desc:
        {
          currentCoffee = currentCoffee.copyWith(description: value as String);
          break;
        }
      case CoffeeFieldKeys.price:
        {
          currentCoffee = currentCoffee.copyWith(price: value as int);
        }
      case CoffeeFieldKeys.isOrdered:
        {
          currentCoffee = currentCoffee.copyWith(isOrdered: value as bool);
        }
      case CoffeeFieldKeys.count:
        {
          currentCoffee = currentCoffee.copyWith(count: value as int);
        }
      case CoffeeFieldKeys.type:
        {
          currentCoffee = currentCoffee.copyWith(coffeeTypes: value as String);
        }
      case CoffeeFieldKeys.image:
        {
          currentCoffee = currentCoffee.copyWith(image: value as String);
        }
    }
    emit(state.copyWith(coffeeModel: currentCoffee));
  }
}
