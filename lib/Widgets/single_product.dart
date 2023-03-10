import 'package:flutter/material.dart';
import '../Config/Colors.dart';

class SingalProduct extends StatelessWidget {
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final VoidCallback? ontap;
  SingalProduct(
      {required this.productImage,
      required this.productName,
      required this.ontap,
      required this.productPrice});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          GestureDetector(
              onTap: ontap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 230,
                  width: 165,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: ontap,
                        child: Container(
                          height: 150,
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            productImage!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                productName!,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$productPrice\$/50 Gram',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            '50 Gram',
                                            style: TextStyle(fontSize: 11),
                                          )),
                                          // ignore: prefer_const_constructors
                                          Center(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 20,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ]));
  }
}
