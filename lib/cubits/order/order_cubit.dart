import 'package:equatable/equatable.dart';
import 'package:final_coffee/data/models/coffee_model/coffee_model.dart';
import 'package:final_coffee/data/network/user_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:final_coffee/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState(unique: signInOnUPUser, coffees: []));

  addOrder(CoffeeModel coffeeModel)async{
    List<CoffeeModel> listOfCoffees = state.coffees;
    if(listOfCoffees.contains(coffeeModel)){

    }else{
      listOfCoffees.add(coffeeModel);
    }
    await getIt.get<FirebaseRepository>().setOrder(list: listOfCoffees);
  }



}
