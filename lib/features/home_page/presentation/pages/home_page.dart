import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/add_product/presentation/pages/add_product.dart';
import 'package:store_app/features/home_page/presentation/manager/home_provider.dart';
import 'package:store_app/features/home_page/presentation/pages/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic productsList;
  @override
  void initState() {
    productsList =
        Provider.of<HomeProvider>(context, listen: false).getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProduct.id);
        },
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.black54,
        ),
      ),
      body: FutureBuilder(
          future: productsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeBody(
                  productsList:
                      Provider.of<HomeProvider>(context).productsList);
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('oops there was an error: ${snapshot.error}'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('ther is no data'));
            }
          }),
    );
  }
}
