class OrderModel {
  int id;
  int pharmacistId;
  String paid;
  String status;
  double finalPrice;
  int medicationsCount;
  DateTime createdAt;
  DateTime updatedAt;
  List<OrderDetail> details;

  OrderModel({
    required this.id,
    required this.pharmacistId,
    required this.paid,
    required this.status,
    required this.finalPrice,
    required this.medicationsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      pharmacistId: json['pharmacist_id'],
      paid: json['paid'],
      status: json['status'],
      finalPrice: double.tryParse(json['final_price'].toString()) ?? 0.0,
      medicationsCount: json['medications_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      details: (json['details'] as List)
          .map((detailJson) => OrderDetail.fromJson(detailJson))
          .toList(),
    );
  }
  static List<OrderModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => OrderModel.fromJson(json)).toList();
  }
}

class OrderDetail {
  int id;
  String commercialNameEn;
  String commercialNameAr;
  int quantity;
  int sale;
  double price;
  double finalPrice;

  OrderDetail({
    required this.id,
    required this.commercialNameEn,
    required this.commercialNameAr,
    required this.quantity,
    required this.sale,
    required this.price,
    required this.finalPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      commercialNameEn: json['commercial_name_en'],
      commercialNameAr: json['commercial_name_ar'],
      quantity: json['quantity'],
      sale: json['sale'],
      price: double.tryParse(json['price'].toString()) ?? 0,
      finalPrice: json['final_price'].toDouble(),
    );
  }
}
