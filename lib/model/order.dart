class OrderModel {
  final int? id;
  final int productId;
  final String productName;
  final double price;
  final String customerName;
  final String customerPhone;
  final double latitude;
  final double longitude;
  final String timestamp;

  OrderModel({
    this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.customerName,
    required this.customerPhone,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'price': price,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      productId: map['product_id'],
      productName: map['product_name'],
      price: map['price'],
      customerName: map['customer_name'],
      customerPhone: map['customer_phone'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      timestamp: map['timestamp'],
    );
  }
}