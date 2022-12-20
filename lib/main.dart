import 'package:dio_example/data/repository/category_repository.dart';
import 'package:dio_example/data/repository/product_repository.dart';
import 'package:dio_example/data/service/api_service.dart';
import 'package:dio_example/screens/app_router.dart';
import 'package:dio_example/view_model/category_view_model.dart';
import 'package:dio_example/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(
            productRepository: ProductRepository(
              apiService: ApiService(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(
            categoryRepository: CategoryRepository(
              apiService: ApiService(),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutName.categories,
      onGenerateRoute: AppRoutes.generateRoute,
      title: 'Dio Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
