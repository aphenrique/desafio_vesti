import 'package:desafio_vesti/features/product/data/datasource/dio/dio_datasource.dart';
import 'package:desafio_vesti/features/product/data/repositories/product_repository_impl.dart';
import 'package:desafio_vesti/features/product/domain/usecases/get_products_usecase.dart';
import 'package:desafio_vesti/features/product/view/controllers/product_list_controler.dart';
import 'package:desafio_vesti/features/product/view/pages/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DioDatasource()),
        Provider(
            create: (context) =>
                ProductRepositoryImpl(context.read<DioDatasource>())),
        Provider(
            create: (context) =>
                GetProductsUsecase(context.read<ProductRepositoryImpl>())),
        ChangeNotifierProvider(
          create: (context) => ProductListController(
            context.read<GetProductsUsecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
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
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/product_list_page": (context) => const ProductListPage(),
          "/product_page": (context) => const ProductListPage(),
        },
      ),
    );
  }
}
