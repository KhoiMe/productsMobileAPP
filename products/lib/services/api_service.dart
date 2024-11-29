import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products/models/product_model.dart';

import '../config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<ProductModel>?> getProducts() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var url = Uri.parse('${Config.apiUrl}/products');
    var response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productsFromJson(data['data']);
    } else {
      return null;
    }
  }

  static Future<bool> saveProduct(ProductModel? model) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};

    var url = Uri.parse('${Config.apiUrl}/add-products');
    var response = await client.post(url,
        headers: headers, body: jsonEncode(model!.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateProduct(ProductModel? model) async {
    Map<String, String> headers = {"Content-Type": 'application/json'};

    final id = model!.id.toString();

    var url = Uri.parse('${Config.apiUrl}/edit-product/$id');
    var response = await client.put(url,
        headers: headers, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> deleteProduct(String? name) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (name == null || name.isEmpty) {
      throw ArgumentError("Product name cannot be null or empty");
    }

    var url = Uri.parse(
        '${Config.apiUrl}/products?productName=${Uri.encodeComponent(name)}');

    var response = await client.delete(url, headers: headers);

    if (response.statusCode == 200) {
      // Parse the response into a ProductModel
      print("Doneeeee");
      return "Done";
    } else {
      throw Exception("Failed to delete product: ${response.reasonPhrase}");
    }
  }
}
