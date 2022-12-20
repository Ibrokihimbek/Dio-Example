

import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/service/api_service.dart';

class CategoryRepository {
  CategoryRepository({required this.apiService});
  ApiService apiService;

  Future<List<CategoryModel?>> getMyProduct()=> apiService.getCategories();

}
