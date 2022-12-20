import 'package:dio_example/data/models/product_model.dart';
import 'package:dio_example/data/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  ProductsModel? productsModel;
  ProductRepository productRepository;

  ProductViewModel({required this.productRepository}) {
    fetchProduct();
  }

  fetchProduct() async {
    productsModel = await productRepository.getMyProduct();
    notifyListeners();
  }
}
