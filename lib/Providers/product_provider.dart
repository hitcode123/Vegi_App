import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../Models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _fruitproductList = [];
  List<ProductModel> _herbproductList = [];
  List<ProductModel> _vegetableproductList = [];
  ProductModel? productModel;
  fetchfruitsProducts() async {
    final List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FruitProducts").get();
    value.docs.forEach((productElement) {
      productModel = ProductModel(
          productImage: productElement.get("productImage"),
          productName: productElement.get("productName"),
          productPrice: productElement.get("productPrice"));

      newList.add(productModel!);
    });
    _fruitproductList = newList;
    notifyListeners();
  }

  fetchherbProducts() async {
    final List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbProduct").get();
    value.docs.forEach((productElement) {
      productModel = ProductModel(
          productImage: productElement.get("productImage"),
          productName: productElement.get("productName"),
          productPrice: productElement.get("productPrice"));

      newList.add(productModel!);
    });
    _herbproductList = newList;
    notifyListeners();
  }

  fetchvegetableProducts() async {
    final List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("VegetableProduct").get();
    value.docs.forEach((productElement) {
      productModel = ProductModel(
          productImage: productElement.get("productImage"),
          productName: productElement.get("productName"),
          productPrice: productElement.get("productPrice"));

      newList.add(productModel!);
    });
    _vegetableproductList = newList;
    notifyListeners();
  }

  List<ProductModel> get fruitProductList {
    return _fruitproductList;
  }

  List<ProductModel> get herbProductList {
    return _herbproductList;
  }

  List<ProductModel> get vegetableProductList {
    return _vegetableproductList;
  }
}
