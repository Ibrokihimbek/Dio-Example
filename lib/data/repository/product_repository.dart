import '../models/product_model.dart';
import '../service/api_service.dart';

class ProductRepository {
  ProductRepository({required this.apiService});
  ApiService apiService;

  Future<ProductsModel?> getMyProduct()=> apiService.getProducts();


}
