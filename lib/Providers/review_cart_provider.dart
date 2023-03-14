import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegi_app/Models/review_cart_model.dart';
import '../auth/sign_in.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData(
      {String? cartId,
      String? cartName,
      String? cartImage,
      int? cartPrice,
      int? cartQuantity}) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity
    });
    notifyListeners();
  }

  List<ReviewCartModel> _ListReviewCart = [];
  void getReviewCartData() async {
    List<ReviewCartModel> ReviewList = [];
    QuerySnapshot getReviewData = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();

    getReviewData.docs.forEach((element) {
      ReviewCartModel tempstorage = ReviewCartModel();

      tempstorage = ReviewCartModel(
          cartId: element.get("cartId"),
          cartName: element.get("cartName"),
          cartImage: element.get("cartImage"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"));

      ReviewList.add(tempstorage);
    });
    _ListReviewCart = ReviewList;

    notifyListeners();
  }

  List<ReviewCartModel> get listReviewCart {
    return _ListReviewCart;
  }

  void deleteReviewCart(cartId) {
    print(cartId);
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
