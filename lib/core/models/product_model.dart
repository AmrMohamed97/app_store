//--------------------------------------------
class ProductModel {
  int id;
  String title;
  String description;
  dynamic price;
  String category;
  String image;
  RateModel? rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      // rating: RateModel.fromJson(json['rating']),
    );
  }
}

class RateModel {
  num? rate;
  int? count;
  RateModel({required this.count, required this.rate});
  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
