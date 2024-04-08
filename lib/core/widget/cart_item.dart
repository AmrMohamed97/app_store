import 'package:flutter/material.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/features/update_product/pages/update_product.dart';

class CartItem extends StatelessWidget {
  const CartItem({required this.model, super.key});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id, arguments: model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 180,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(10, 10),
                )
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(model.title.substring(0, 6),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${model.price}',
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 85,
            right: 32,
            child: Image.network(
              model.image,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
