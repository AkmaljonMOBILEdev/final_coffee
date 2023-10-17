part of 'coffee_cubit.dart';

class CoffeeState extends Equatable {
  final CoffeeModel coffeeModel;

  const CoffeeState({required this.coffeeModel});

  CoffeeState copyWith({CoffeeModel? coffeeModel}) {
    return CoffeeState(coffeeModel: coffeeModel ?? this.coffeeModel);
  }

  @override
  List<Object?> get props => [coffeeModel];
}
