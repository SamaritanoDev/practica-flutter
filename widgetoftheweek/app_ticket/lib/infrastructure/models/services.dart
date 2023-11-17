// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);
class Services {
  final String code;
  final String name;
  final String price;

  Services({
    required this.code,
    required this.name,
    required this.price,
  });

  factory Services.fromJsonMap (Map<String, dynamic> json) => Services(
        code: json["code"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "price": price,
      };
}
