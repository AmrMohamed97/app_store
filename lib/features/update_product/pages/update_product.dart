import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/widget/custom_button.dart';
import 'package:store_app/core/widget/custom_text_form_field.dart';
import 'package:store_app/features/home_page/manager/home_provider.dart';

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});
  static const String id = 'UpdateProduc';
  void intFormField(context, ProductModel model) {
    Provider.of<HomeProvider>(context, listen: false)
        .descriptionController
        .text = model.description;
    Provider.of<HomeProvider>(context, listen: false).imageController.text =
        model.image;
    Provider.of<HomeProvider>(context, listen: false).priceController.text =
        model.price.toString();
    Provider.of<HomeProvider>(context, listen: false)
        .productNameController
        .text = model.title;
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    intFormField(context, model);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            CustomTextFormField(
              controller:
                  Provider.of<HomeProvider>(context).productNameController,
              hintText: 'ProductName',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller:
                  Provider.of<HomeProvider>(context).descriptionController,
              hintText: 'Description',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: Provider.of<HomeProvider>(context).priceController,
              hintText: 'Price',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: Provider.of<HomeProvider>(context).imageController,
              hintText: 'Image',
            ),
            const SizedBox(
              height: 60,
            ),
             CustomButton(
              onTab: () {
                Provider.of<HomeProvider>(context, listen: false).updateProduct(
                  context: context,
                  id: model.id,
                  category: model.category,
                );
              },
              label: 'Update',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
