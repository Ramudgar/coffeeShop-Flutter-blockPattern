import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Helpers/BaseServerUrl.dart';
import '../Models/Home/CategoriesProduct.dart';
import '../Models/Home/HomeCarousel.dart';
import '../Models/Home/ProductHome.dart';
import 'AuthController.dart';

class HomeController {
  String server = baseServerUrl;

  Future<List<SliderHome>> getHomeCarouselSlider() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/home-carousel'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return HomeCarousel.fromJson(jsonDecode(resp.body)).slider;
  }

  Future<List<Category>> getListCategoriesProducts() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }

  Future<List<Product>> getListProductsHome() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-products-home'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return ProductHome.fromJson(jsonDecode(resp.body)).products;
  }

  Future<List<Category>> getListCategories() async {
    final token = await authController.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories-all'),
        headers: {'Accept': 'application/json', 'xx-token': token});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }
}

final dbHomeController = HomeController();
