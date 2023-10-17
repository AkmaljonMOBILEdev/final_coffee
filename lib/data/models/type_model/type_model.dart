import '../../../utils/icons.dart';

class CoffeeTypeModel {
  final String title;
  final String image;

  CoffeeTypeModel({
    required this.image,
    required this.title,
  });
}

List<CoffeeTypeModel> coffeeTypes = [
  CoffeeTypeModel(image: AppIcons.all, title: "All"),
  CoffeeTypeModel(image: AppIcons.espresso, title: "Espresso"),
  CoffeeTypeModel(image: AppIcons.latte, title: "Latte"),
  CoffeeTypeModel(image: AppIcons.americano, title: "Americano"),
  CoffeeTypeModel(image: AppIcons.mocha, title: "Mocha"),
  CoffeeTypeModel(image: AppIcons.affogato, title: "Affogato"),
  CoffeeTypeModel(image: AppIcons.cappuccino, title: "Cappuccino"),
];