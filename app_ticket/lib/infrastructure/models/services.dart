// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);
class Services {
  final String code;
  final String name;
  final double price;

  Services({
    required this.code,
    required this.name,
    required this.price,
  });

  factory Services.fromJsonMap(Map<String, dynamic> map) {
    return Services(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] != null ? double.tryParse(map['price']) ?? 0.0 : 0.0,
    );
  }

  // factory Services.fromJsonMap(Map<String, dynamic> json) => Services(
  //       code: json["code"],
  //       name: json["name"],
  //       price: json["price"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "code": code,
  //       "name": name,
  //       "price": price,
  //     };

  // List<Services> servicesFromJsonList(List<dynamic> jsonList) {
  //   return jsonList.map((json) => Services.fromJsonMap(json)).toList();
  // }
}
