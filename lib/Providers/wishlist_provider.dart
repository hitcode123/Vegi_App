import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegi_app/Models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData(
      {String? wishListId,
      String? wishListName,
      String? wishListImage,
      int? wishListPrice,
      int? wishListQuantity,
      bool? wishList}) async {
    await FirebaseFirestore.instance
        .collection("WishListCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListCart")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishList": wishList
    });
    notifyListeners();
  }

  List<ProductModel> _wishList = [];
/////  getData from wishistProvider  ////
  void getwishListData() async {
    List<ProductModel> tempwishList = [];
    QuerySnapshot getdata = await FirebaseFirestore.instance
        .collection("WishListCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListCart")
        .get();
    // print(getdata.docs);
    getdata.docs.forEach((element) {
      ProductModel eachWishItem = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),
          productQuantity: element.get("wishListQuantity"));
      tempwishList.add(eachWishItem);
    });
    _wishList = tempwishList;
    // print(tempwishList);
    notifyListeners();
  }

  List<ProductModel> get getwishList {
    return _wishList;
  }

  getdeleted(String? id) {
    print("chutiye yha kyu aye ho");
    FirebaseFirestore.instance
        .collection("WishListCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListCart")
        .doc(id)
        .delete();
    notifyListeners();
  }
}
