import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_coffee/data/network/user_repository.dart';
import 'package:final_coffee/services/service_locator/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/coffee_model/coffee_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  StreamSubscription? _subscription;

  void changeState(SearchState state){
    emit(state);
  }

  void search(String query) async {
    _subscription?.cancel(); // Cancel any existing subscription

    _subscription = getIt.get<FirebaseRepository>().search(query).listen(
          (List<CoffeeModel> models) {
            if(models.isNotEmpty) {
              emit(SearchSuccess(items: models)); // Emitting a new state
            }else{
              emit(SearchNotFound());
            }
      }
    );
  }

}
