import 'package:flutter/material.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/widget/cart_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.productsList, super.key});
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 80.0),
      child: GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 100,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) => CartItem(model: productsList[index]),
        itemCount: productsList.length,
      ),
    );
  }
}
