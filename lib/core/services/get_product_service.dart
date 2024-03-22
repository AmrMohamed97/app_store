import 'package:store_app/core/helper/api.dart';

import 'package:store_app/core/models/product_model.dart';

class GetProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<ProductModel> products = [];
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
