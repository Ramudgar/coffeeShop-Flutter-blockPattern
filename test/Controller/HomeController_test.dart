import 'package:aimsdigital/Controller/HomeController.dart';
import 'package:aimsdigital/Models/Home/CategoriesProduct.dart';
import 'package:aimsdigital/Models/Home/HomeCarousel.dart';
import 'package:aimsdigital/Models/Product/Product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'HomeController_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  HomeController homeController;
  List<SliderHome> listSliderHome;
  List<Category> listCategory;
  List<Product> listProduct;
  setUpAll(() {
    homeController = MockHomeController();
    listSliderHome = [
      SliderHome(
        category: "Marketing",
        id: "1",
        image: "image.png",
        v: 1,
      ),
      SliderHome(
        category: "Coding",
        id: "2",
        image: "image.png",
        v: 2,
      ),
      SliderHome(
        category: "Programming",
        id: "3",
        image: "image.png",
        v: 3,
      ),
    ];
    listCategory = [
      Category(
        id: "1",
        category: "Marketing",
        picture: "image.png",
        status: true,
        v: 1,
      ),
      Category(
        id: "2",
        category: "Coding",
        picture: "image.png",
        status: false,
        v: 2,
      ),
      Category(
        id: "3",
        category: "Personal",
        picture: "image.png",
        status: true,
        v: 3,
      ),
    ];
    listProduct = [
      Product(
        id: "1",
        categoryId: "1",
        codeProduct: "1",
        description: "Description",
        nameProduct: "How to become flutter developer",
        picture: "image.png",
        price: 100.0,
        status: "Active",
        stock: 100,
        v: 1,
      ),
      Product(
        id: "2",
        categoryId: "2",
        codeProduct: "2",
        description: "Description",
        nameProduct: "Learn Node JS",
        picture: "image.png",
        price: 100.0,
        status: "Active",
        stock: 100,
        v: 2,
      ),
    ];
  });
  test('Getting sliders for home ...', () async {
    when(homeController.getHomeCarouselSlider())
        .thenAnswer((realInvocation) async => listSliderHome);

    List<SliderHome> result = await homeController.getHomeCarouselSlider();
    expect(result, listSliderHome);
  });
  test('Getting sliders for home unsuccessful ...', () async {
    when(homeController.getHomeCarouselSlider())
        .thenAnswer((realInvocation) async => []);

    List<SliderHome> result = await homeController.getHomeCarouselSlider();
    expect(result, []);
  });
  test('Fetching list of categories that belongs to the Products ...',
      () async {
    when(homeController.getListCategoriesProducts())
        .thenAnswer((realInvocation) async => listCategory);

    List<Category> result = await homeController.getListCategoriesProducts();
    expect(result, listCategory);
  });
  test(
      'Fetching list of categories that belongs to the Products but returns empty ...',
      () async {
    when(homeController.getListCategoriesProducts())
        .thenAnswer((realInvocation) async => []);

    List<Category> result = await homeController.getListCategoriesProducts();
    expect(result, []);
  });
}
