import 'package:equatable/equatable.dart';

class TabState extends Equatable {
  final int index;
  final bool isAdmin;
  final String type;
  final int selectedIndex;

  const TabState({
    required this.index,
    required this.isAdmin,
    required this.type,
    required this.selectedIndex,
  });

  TabState copyWith({
    int? index,
    int? selectedIndex,
    String? type,
    bool? isAdmin,
  }) {
    return TabState(
      index: index ?? this.index,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      type: type ?? this.type,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  @override
  List<Object?> get props => [index, isAdmin, type, selectedIndex];
}
