import 'dart:convert';

import 'package:aimsdigital/Controller/AuthController.dart';
import 'package:aimsdigital/Helpers/BaseServerUrl.dart';
import 'package:aimsdigital/Models/Home/ProductHome.dart';
import 'package:aimsdigital/Models/Product.dart';
import 'package:aimsdigital/Models/Product/FavoriteProduct.dart';
import 'package:aimsdigital/Models/Response/PurchasedProductsResponse.dart';
import 'package:aimsdigital/Models/ResponseModels.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductController {
  String server = baseServerUrl;
  final secureStorage = FlutterSecureStorage();

  Future<ResponseModels> addOrDeleteProductFavorite({String uidProduct}) async {
    final token = await authController.readToken();
    final resp = await http.post(Uri.parse('$server/add-Favorite-Product'),
        headers: {
          'Accept': 'application/json',
          'xx-token': token
        },
        body: {
          'uidProduct': uidProduct,
          'uidUser': await secureStorage.read(key: 'uid')
        });
    print(resp.body);

    return ResponseModels.fromJson(jsonDecode(resp.body));
  }

  Future<List<Favorite>> favoriteProducts() async {
    final token = await authController.readToken();

    final resp = await http.get(
      Uri.parse('$server/product-favorite-for-user'),
      headers: {'Accept': 'application/json', 'xx-token': token},
    );

    // print(resp.body);

    var favs = FavoriteProduct.fromJson(jsonDecode(resp.body)).favorites;
    print(favs);
    return favs;
  }

  Future<ResponseModels> saveOrderBuyProduct(
      {String receipt,
      String date,
      String amount,
      List<ProductCart> products}) async {
    final token = await authController.readToken();

    Map<String, dynamic> data = {
      'receipt': receipt,
      'date': date,
      'amount': amount,
      'products': products
    };

    final body = json.encode(data);

    final resp = await http.post(Uri.parse('$server/save-order-products'),
        headers: {'Content-type': 'application/json', 'xx-token': token},
        body: body);

    return ResponseModels.fromJson(jsonDecode(resp.body));
  }

  Future<PurchasedProductResponse> getPurchasedProducts() async {
    final token = await authController.readToken();

    final response = await http.get(
      Uri.parse('$server/get-purchased-products'),
      headers: {'Content-type': 'application/json', 'xx-token': token},
    );

    return PurchasedProductResponse.fromJson(jsonDecode(response.body));
  }

  Future<List<Product>> getProductsForCategories({String id}) async {
    final token = await authController.readToken();

    final response = await http.get(
      Uri.parse('$server/get-products-for-categories/' + id),
      headers: {'Content-type': 'application/json', 'xx-token': token},
    );

    return ProductHome.fromJson(jsonDecode(response.body)).products;
  }
}

final dbProductController = ProductController();
