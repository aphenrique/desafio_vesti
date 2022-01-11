import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:desafio_vesti/features/basket/view/widgets/basket_item_counter_widget.dart';
import 'package:desafio_vesti/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:desafio_vesti/features/product/view/widgets/product_view_widget.dart';
import 'package:desafio_vesti/features/product/view/widgets/category_menu_widget.dart';
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

    final basket = context.watch<Basket>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zummedy"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: _productList.value.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(color: Colors.grey.shade300),
                const CategoryMenuWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade200,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceBetween,
                        children: _productList.value
                            .map((e) => ProductViewWidget(product: e))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Going to shopping basket!");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        backgroundColor: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: const [
            Positioned.fill(
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
              child: BasketItemCounterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
