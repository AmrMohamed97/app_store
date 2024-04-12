import 'package:store_app/core/helper/api.dart';
import 'package:store_app/core/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String description,
      required String price,
      required String category,
      required String image}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products',body: {
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
    });
    return ProductModel.fromJson(data);
  }
}
