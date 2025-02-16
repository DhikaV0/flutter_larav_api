import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class HttpService {
  final String baseUrl = "http://127.0.0.1:8000/api/products";

  Future<List<Produk>> getPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> produklist = jsonData['data'];
      return produklist.map((json) => Produk.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts. Status code: ${response.statusCode}");
    }
  }

  Future<List<Produk>> getProduk(int nomorProduk) async {
    final response = await http.get(Uri.parse("$baseUrl/$nomorProduk"));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> produklist = jsonData['list']['stock'];
      return produklist.map((json) => Produk.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load produk. Status code: ${response.statusCode}");
    }
  }
}
