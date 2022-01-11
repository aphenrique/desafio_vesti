import 'basket/domain/entities/basket.dart';
import 'basket/domain/usecases/add_item_to_basket_usecase.dart';
import 'basket/view/controllers/basket_quantity.dart';
import 'package:desafio_vesti/features/product/data/datasource/dio/dio_categories_datasource.dart';
import 'package:desafio_vesti/features/product/data/datasource/dio/dio_products_datasource.dart';
import 'package:desafio_vesti/features/product/data/datasource/dio/dio_service.dart';
import 'package:desafio_vesti/features/product/data/datasource/get_categories_datasource.dart';
import 'package:desafio_vesti/features/product/data/datasource/get_product_datasource.dart';
import 'package:desafio_vesti/features/product/data/repositories/category_repository_impl.dart';
import 'package:desafio_vesti/features/product/data/repositories/product_repository_impl.dart';
import 'package:desafio_vesti/features/product/domain/repositories/catagory_repository.dart';
import 'package:desafio_vesti/features/product/domain/repositories/product_repository.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_categories_usecase.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:desafio_vesti/features/product/view/controllers/category_list_controller.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:desafio_vesti/utils/app_routes.dart';
import 'package:desafio_vesti/utils/http_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'basket/domain/usecases/remove_item_to_basket_usecase.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _routes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Product's Dependency injection
        Provider<HttpService>(create: (context) => DioService()),
        Provider<GetProductsDatasource>(
            create: (context) => DioProductsDatasource(context.read())),
        Provider<ProductRepository>(
            create: (context) => ProductRepositoryImpl(context.read())),
        Provider<GetProductsUsecase>(
            create: (context) => GetProductsUsecase(context.read())),
        ChangeNotifierProvider(
          create: (context) => ProductListController(
            context.read(),
          ),
        ),

        /// Category's Dependency injection
        Provider<HttpService>(create: (context) => DioService()),
        Provider<GetCategoriesDatasource>(
            create: (context) => DioCategoriesDatasource(context.read())),
        Provider<CategoryRepository>(
            create: (context) => CategoryRepositoryImpl(context.read())),
        Provider<GetCategoriesUsecase>(
            create: (context) => GetCategoriesUsecase(context.read())),
        ChangeNotifierProvider(
          create: (context) => CategoryListController(
            context.read(),
          ),
        ),

        /// Basket singleton
        Provider(create: (context) => Basket()),
        Provider(
            create: (context) =>
                AddItemToBasketUsecase(basket: context.read<Basket>())),
        Provider(
            create: (context) =>
                RemoveItemToBasketUsecase(basket: context.read<Basket>())),

        ChangeNotifierProvider(create: (context) => BasketQuantity()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.grey),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            elevation: 100,
            sizeConstraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Colors.white,
            elevation: 1,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                  const Size(double.maxFinite, 60)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.deepOrange),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ),
        initialRoute: "/",
        routes: _routes(),
      ),
    );
  }
}
