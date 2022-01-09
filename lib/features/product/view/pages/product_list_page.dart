import 'package:desafio_vesti/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    final _productList = context.watch<ProductListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zummedy"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text("Categoria Teste")),
                  TextButton(
                      onPressed: () {}, child: const Text("Categoria Teste")),
                  TextButton(
                      onPressed: () {}, child: const Text("Categoria Teste")),
                  TextButton(
                      onPressed: () {}, child: const Text("Categoria Teste")),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                children: _productList.getProductsWidgets(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 100,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        backgroundColor: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            const Positioned.fill(
              child: SizedBox(
                height: 80,
                width: 80,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: -12,
              child: SizedBox(
                width: 30,
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: const Text(
                      "01",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
