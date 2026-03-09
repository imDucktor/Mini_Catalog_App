import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class DataService {
  static const String _apiUrl = 'https://dummyjson.com/products?limit=20';

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'];
        
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      // API call failed, but we still need to return some data for the demo
      // if internet is down.
      return [];
    }
  }
}
