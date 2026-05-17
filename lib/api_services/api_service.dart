import 'dart:convert';

import 'package:app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  get ProductModel => null;

  Future<List<Data>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Data.fromJson(e)).toList();
    } else {
      throw Exception("Hata oluştu");
    }
  }
}
