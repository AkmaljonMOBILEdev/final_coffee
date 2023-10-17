import 'package:equatable/equatable.dart';
import 'package:final_coffee/data/models/coffee_model/coffee_model.dart';
import 'package:final_coffee/data/models/universal_data.dart';
import 'package:final_coffee/data/network/user_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:final_coffee/utils/constants.dart';
import 'package:final_coffee/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_model/user_field_keys.dart';
import '../../data/models/user_model/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
          UserState(
              userModel:
                  UserModel(name: "", phone: "", address: "", isAdmin: false, orderedList: [], uniqueness: signInOnUPUser),
              error: ""),
        );
  //fake
  void signFakeUser(BuildContext context)async{
    showLoading(context: context);
     getIt.get<FirebaseRepository>().signUser(userModel: state.userModel);
     if(context.mounted) hideLoading(context: context);
  }

  void signUpFake()async{
    await getIt.get<FirebaseRepository>().signUpUser();
  }

  void loginFake()async{
    UniversalData data = await getIt.get<FirebaseRepository>().loginUser();
    debugPrint("Fake user - ${data.data} is login");
  }

  void logOut()async{
    UniversalData data = await getIt.get<FirebaseRepository>().logOut();
    debugPrint("USER LOGGED OUT: ${data.data}");
  }

  // signUserOnFireStore() async {
  //   UniversalData data =
  //       await getIt.get<FirebaseRepository>().signUser(userModel: state.userModel);
  //   if (data.data == "User is signed!") {}
  // }

  // updateUser() async {
  //   UniversalData data = await getIt
  //       .get<FirebaseRepository>()
  //       .updateUser(userModel: state.userModel);
  // }

  cleanFields() {
    emit(state.copyWith(
        userModel:
            UserModel(name: "", phone: "", address: "", isAdmin: false, orderedList: [], uniqueness: signInOnUPUser)));
  }

  updateUserFields({
    required UserFieldKeys fieldKey,
    required dynamic value,
  }) {
    UserModel currentUser = state.userModel;

    switch (fieldKey) {
      case UserFieldKeys.name:
        {
          currentUser = currentUser.copyWith(name: value as String);
          break;
        }
      case UserFieldKeys.phone:
        {
          currentUser = currentUser.copyWith(phone: value as String);
          break;
        }
      case UserFieldKeys.list:
        {
          currentUser = currentUser.copyWith(orderedList: value as List<CoffeeModel>);
          break;
        }
      case UserFieldKeys.address:
        {
          currentUser = currentUser.copyWith(address: value as String);
        }
      case UserFieldKeys.isAdmin:
        {
          currentUser = currentUser.copyWith(isAdmin: value as bool);
        }
    }
    emit(state.copyWith(userModel: currentUser));
  }
}
