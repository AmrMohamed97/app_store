import 'package:store_app/core/helper/api.dart';
import 'package:store_app/core/models/product_model.dart';

class GetCategoryService {
  Future<List<ProductModel>> getCategoryService(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> categories = [];

    for (var product in data) {
      categories.add(ProductModel.fromJson(product));
    }
    return categories;
  }
}
