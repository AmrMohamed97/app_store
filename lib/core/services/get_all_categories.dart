import 'package:store_app/core/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return response;
  }
}
