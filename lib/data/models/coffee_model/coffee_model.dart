import 'coffee_types.dart';

class CoffeeModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  final String type;
  final int count;
  final bool isOrdered;

  CoffeeModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.type,
      required this.count,
      required this.isOrdered});

  CoffeeModel copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? image,
    String? coffeeTypes,
    int? count,
    bool? isOrdered,
  }) =>
      CoffeeModel(
          id: id ?? this.id,
          name: name ?? this.name,
          description: description ?? this.description,
          price: price ?? this.price,
          image: image ?? this.image,
          type: coffeeTypes ?? type,
          count: count ?? this.count,
          isOrdered: isOrdered ?? this.isOrdered);

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      description: json["description"] as String? ?? "",
      price: json["price"] as int? ?? 0,
      image: json["image"] as String? ?? "",
      type: json["type"] as String ?? "",
      count: json["count"] as int? ?? 0,
      isOrdered: json["isOrdered"] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "image": image,
      "type": type,
      "count": count,
      "isOrdered": isOrdered,
    };
  }

  @override
  String toString() {
    return """
    name: $name,
    desc: ${description.substring(0,10)},
    count: $count,
    price: $price,
    type: $type,
    image: $image,
    isOrdered: $isOrdered
    """;
  }
}
