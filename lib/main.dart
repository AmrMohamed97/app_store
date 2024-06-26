import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/home_page/manager/home_provider.dart';
import 'package:store_app/features/home_page/pages/home_page.dart';

import 'features/add_product/pages/add_product.dart';
import 'features/update_product/pages/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          UpdateProduct.id: (context) => const UpdateProduct(),
          AddProduct.id: (context) => const AddProduct(),
        },
      ),
    );
  }
}
