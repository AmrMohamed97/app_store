import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/widget/custom_button.dart';
import 'package:store_app/core/widget/custom_text_form_field.dart';
import 'package:store_app/features/home_page/manager/home_provider.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  static const String id = 'Add Product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 90,
            ),
            CustomTextFormField(
              controller: Provider.of<HomeProvider>(context).categoryController,
              hintText: 'Category Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller:
                  Provider.of<HomeProvider>(context).newProductController,
              hintText: 'Product Name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: Provider.of<HomeProvider>(context)
                  .newProductDescriptionController,
              hintText: 'Description',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller:
                  Provider.of<HomeProvider>(context).newProductPriceController,
              hintText: 'Price',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: Provider.of<HomeProvider>(context).newImageController,
              hintText: 'Image',
            ),
            const SizedBox(
              height: 60,
            ),
             CustomButton(
              onTab: () {
                Provider.of<HomeProvider>(context, listen: false)
                    .addProductToStore(context: context);
              },
              label: 'Add Product',
              color: Colors.blue,
            ),
           ],
        ),
      ),
    );
  }
}
