import 'package:final_coffee/cubits/tab/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(const TabState(index: 0, isAdmin: false, selectedIndex: 0, type: "All"));
  void changeTabIndex(int newTabIndex) => emit(state.copyWith(index: newTabIndex));
  void changeAdmin(bool value) => emit(state.copyWith(isAdmin: value));
  void changeSelectedIndex(int newSelectedIndex) => emit(state.copyWith(selectedIndex: newSelectedIndex));
  void changeType(String type) => emit(state.copyWith(type: type));
}
