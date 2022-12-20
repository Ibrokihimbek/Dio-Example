import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/repository/category_repository.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel>? categoryModel;
  CategoryRepository categoryRepository;

  CategoryViewModel({required this.categoryRepository}) {
    fetchCategory();
  }

  fetchCategory() async {
    categoryModel =
        await categoryRepository.getMyProduct() as List<CategoryModel>;
    notifyListeners();
  }
}
