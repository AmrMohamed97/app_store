import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/services/add_product.dart';
import 'package:store_app/core/services/get_product_service.dart';
import 'package:store_app/core/services/update_product.dart';

class HomeProvider with ChangeNotifier {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController newProductController = TextEditingController();
  TextEditingController newImageController = TextEditingController();
  TextEditingController newProductPriceController = TextEditingController();
  TextEditingController newProductDescriptionController =
      TextEditingController();
  List<ProductModel> productsList = [];
  Future<List<ProductModel>?> getProduct() async {
    try {
      productsList = await GetProductService().getAllProducts();
      notifyListeners();
      return productsList;
    } catch (error) {
      log(error.toString());
      notifyListeners();
      return null;
    }
  }

  ProductModel? editedProduct;
  Future<void> updateProduct({
    required BuildContext context,
    required int id,
    required String category,
  }) async {
    try {
      editedProduct = await UpdateProductService().updateProduct(
        id: id,
        category: category,
        description: descriptionController.text,
        price: priceController.text,
        image: imageController.text,
        title: productNameController.text,
      );
      log('===================success===============');
      log(editedProduct!.title);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Product updated Successfully',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ));
      descriptionController.clear;
      priceController.clear;
      imageController.clear;
      productNameController.clear;
      Navigator.pushNamed(context, '/');
      notifyListeners();
    } catch (error) {
      log('===================error===============');
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'error',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
      notifyListeners();
    }
  }

  Future<void> addProductToStore({
    required BuildContext context,
  }) async {
    try {
      editedProduct = await AddProductService().addProduct(
        title: newProductController.text,
        description: newProductDescriptionController.text,
        price: newProductPriceController.text,
        category: categoryController.text,
        image: newImageController.text,
      );
      newProductController.clear();
      newProductDescriptionController.clear();
      newProductPriceController.clear();
      categoryController.clear();
      newImageController.clear();
      log('===================success===============');
      log(editedProduct!.image);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Product add Successfully',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ));
      Navigator.pushNamed(context, '/');
      notifyListeners();
    } catch (error) {
      log(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'error',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ));
      notifyListeners();
    }
  }
}
