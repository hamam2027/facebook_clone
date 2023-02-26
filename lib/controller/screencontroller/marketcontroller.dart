import 'dart:convert';

import 'package:flutter_application_2/mdel/productmodel.dart';
import 'package:flutter_application_2/mdel/productsmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MarketController extends GetxController {
  Prodmodel? prodmodel;
  Productsmodel? productsmodel;

  List<String> categoryes = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];
  List<Productsmodel> list = [];

  getproducts() async {
    for (int i = 0; i < categoryes.length; i++) {
      http.Response response = await http.get(Uri.parse(
          "https://dummyjson.com/products/category/${categoryes[i]}"));
      Map<String, dynamic> data = jsonDecode(response.body);

      productsmodel = Productsmodel.fromJson(data);
      // print(productsmodel!.products!.length);
      list.add(productsmodel!);
      print(list.length);
      print(categoryes.length);

      update();
    }
  }
}

 

  // Productsmodel? productsmodele;

  // getcategory() {
  //   categoryes.forEach((element) async {
  //     http.Response response = await http
  //         .get(Uri.parse("https://dummyjson.com/products/category/$element"));
  //     Map<String, dynamic> data = jsonDecode(response.body);

  //     productsmodele = Productsmodel.fromJson(data);
  //     productsmodele!.products!.forEach((element) {
  //       element.category == "cckkck";
  //     });
  //   });

  //   update();
  // }

