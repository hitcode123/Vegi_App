import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vegi_app/Config/Colors.dart';

class SingleUtility extends StatelessWidget {
  bool isBool = false;
  final String productImage;
  final String productName;
  final int productPrice;

  SingleUtility(
      {required this.isBool,
      required this.productImage,
      required this.productName,
      required this.productPrice});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(productImage),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              height: 100,
              width: 130,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "50\$/50 gram",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              height: 35,
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                      productPrice.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    )),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    )
                                  ]),
                            )
                          : Text("${productPrice} gram"),
                    ]),
              ),
            )),
        Expanded(
            flex: isBool == false ? 1 : 2,
            child: Container(
                height: 90,
                padding: isBool == false
                    ? EdgeInsets.symmetric(horizontal: 5, vertical: 32)
                    : EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 25,
                      ),
                margin: EdgeInsets.only(right: 5),
                child: isBool == false
                    ? Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: primaryColor,
                            ),
                            Text(
                              "ADD",
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            )
                          ],
                        )),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                              color: primaryColor,
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 25,
                              width: 75,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    "ADD",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: primaryColor,
                                  )
                                ],
                              )),
                            )
                          ],
                        ),
                      )))
      ],
    );
  }
}
