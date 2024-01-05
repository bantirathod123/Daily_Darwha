// shopping_bag_model.dart (Frontend)

class ShoppingBagModel {
  final int? id; // Nullable int for auto-generated ID
  final String name;
  final String imagePath;
  final double price;
  final int quantity;

  ShoppingBagModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.quantity,
  });

  // Factory constructor to convert a Map to a ShoppingBagModel instance
  factory ShoppingBagModel.fromJson(Map<String, dynamic> json) {
    return ShoppingBagModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      price: json['price'] as double,
      quantity: json['quantity'] as int,
    );
  }

  // Convert ShoppingBagModel instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'price': price,
      'quantity': quantity,
    };
  }
}
