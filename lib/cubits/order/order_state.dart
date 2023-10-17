part of 'order_cubit.dart';

class OrderState extends Equatable{
  final String unique;
  final List<CoffeeModel> coffees;

  const OrderState({required this.unique, required this.coffees});

  @override
  List<Object?> get props => [unique, coffees];

}

