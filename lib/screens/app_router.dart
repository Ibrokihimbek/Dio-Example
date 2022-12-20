import 'package:dio_example/screens/categories/categories_page.dart';
import 'package:dio_example/screens/products/products_page.dart';
import 'package:flutter/material.dart';

abstract class RoutName {
  static const product = 'product';
  static const categories = 'categories';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.product:
        return MaterialPageRoute(builder: (_) => ProductsPage());

      case RoutName.categories:
        return MaterialPageRoute(
          builder: (_) => CategoriesPage(),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
