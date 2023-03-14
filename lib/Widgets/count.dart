import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCart = Provider.of<ReviewCartProvider>(context);
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
                      }
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
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
                          cartQuantity: count);
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
