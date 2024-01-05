class ShoppingBagModel {
  late final String id;
  final String productName;
  final double price;
  late final String weight;
  int quantity;

  ShoppingBagModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.weight,
    required this.quantity,
    required String imagePath,
  });

  factory ShoppingBagModel.fromMap(Map<String, dynamic> map) {
    return ShoppingBagModel(
      id: map['id'] as String,
      productName: map['productName'] as String,
      price: map['price'] as double,
      weight: map['weight'] as String,
      quantity: map['quantity'] as int,
      imagePath: '', // You can provide the actual imagePath here if available
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'price': price,
      'weight': weight,
      'quantity': quantity,
    };
  }
}
