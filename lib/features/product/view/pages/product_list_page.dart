import 'package:desafio_vesti/features/basket/domain/entities/basket.dart';
import 'package:desafio_vesti/features/basket/view/controllers/basket_quantity.dart';
import 'package:desafio_vesti/features/basket/view/widgets/basket_item_counter_widget.dart';
import 'package:desafio_vesti/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:desafio_vesti/features/product/view/controllers/category_list_controller.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:desafio_vesti/features/product/view/pages/product_view_widget.dart';
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
    final _categoryList = context.watch<CategoryListController>();
    final basket = context.read<Basket>();
    var basketQuantity = context.watch<BasketQuantity>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zummedy"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.maybePop(context),
        ),
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
                children: _categoryList.value
                    .map((e) =>
                        TextButton(onPressed: () {}, child: Text(e.category)))
                    .toList(),
              ),
            ),
            Container(
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
