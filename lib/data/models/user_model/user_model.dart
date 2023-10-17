import '../coffee_model/coffee_model.dart';

class UserModel {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String uniqueness;
  final List<CoffeeModel> orderedList;
  final bool isAdmin;

  UserModel({
    this.id = "",
    required this.name,
    required this.phone,
    required this.uniqueness,
    required this.address,
    required this.orderedList,
    required this.isAdmin,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? uniqueness,
    String? address,
    List<CoffeeModel>? orderedList,
    bool? isAdmin,
  }) =>
      UserModel(
        id: id??this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        uniqueness: uniqueness ?? this.uniqueness,
        address: address ?? this.address,
        orderedList: orderedList ?? this.orderedList,
        isAdmin: isAdmin ?? this.isAdmin,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      uniqueness: json["uniqueness"] as String? ?? "",
      orderedList: json["orderedList"] as List<CoffeeModel>? ?? [],
      address: json["address"] as String? ?? "",
      isAdmin: json["isAdmin"] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name": name,
      "phone": phone,
      "uniqueness": uniqueness,
      "list": orderedList,
      "address": address,
      "isAdmin": isAdmin,
    };
  }


}
