import 'package:dio/dio.dart';
import 'package:flulang_frontend/product_model.dart';

class ProductService {
  //final String productsURL = 'http://localhost:5000/products';
  final String productsURL = 'http://172.28.16.1:5000/products';
  final Dio dio = Dio();

  ProductService();

  Future<List<Product>> getProducts() async {
    late List<Product> products;
    try {
      final res = await dio.get(productsURL);

      products = res.data['products']
          .map<Product>(
            (item) => Product.fromJson(item),
          )
          .toList();
    } on DioError catch (_) {
      products = [];
    }

    return products;
  }
}
