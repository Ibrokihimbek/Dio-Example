import 'package:dio/dio.dart';
import 'package:dio_example/data/models/category_model.dart';
import 'package:dio_example/data/models/product_model.dart';
import 'package:dio_example/data/service/api_client.dart';

class ApiService extends ApiClient {
  Future<ProductsModel?> getProducts() async {
    // Dio dio = Dio();

    try {
      Response response = await dio.get("${dio.options.baseUrl}/products");
      if (200 <= response.statusCode! && response.statusCode! < 300) {
        return ProductsModel.fromJson(response.data);
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    // Dio dio = Dio();
    try {
      Response response = await dio.get("${dio.options.baseUrl}/categories");
      if (response.statusCode == 200) {
        return (response.data as List?)
                ?.map((e) => CategoryModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      print(err.toString());
    }
    return [];
  }
}
