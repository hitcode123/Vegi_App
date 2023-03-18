import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Count extends StatefulWidget {
  String? productName;
  String? productImage;
  String? productId;
  int? productPrice;

  Count({
    this.productName,
    this.productImage,
    this.productId,
    this.productPrice,
  });
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;
  getAddproduct() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (this.mounted) {
        if (value.exists) {
          setState(() {
            count = value.get("cartQuantity");
            isTrue = value.get("isTrue");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCart = Provider.of<ReviewCartProvider>(context);
    getAddproduct();
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: isTrue == true
            ? Row(
                children: [
                  InkWell(
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.yellow,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (count >= 1) {
                          count++;
                          setState(() {});
                        }
                        reviewCart.reviewupdateproduct(
                            id: widget.productId, count: count);
                      });
                    },
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                        reviewCart.deleteReviewCart(widget.productId);
                      }
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                        reviewCart.reviewupdateproduct(
                            id: widget.productId, count: count);
                      }
                    },
                  )
                ],
              )
            : Container(
                width: 40,
                height: 20,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = true;
                      });
                      reviewCart.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                          isTrue: isTrue);
                    },
                    child: Text(
                      "ADD",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ));
  }
}
