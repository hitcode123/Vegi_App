import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';
import 'package:vegi_app/Widgets/count.dart';

class SingleUtility extends StatefulWidget {
  bool isBool = false;
  final String? id;
  final String productImage;
  final String productName;
  final int productPrice;
  VoidCallback onDelete;

  SingleUtility(
      {required this.id,
      required this.isBool,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.onDelete});

  @override
  State<SingleUtility> createState() => _SingleUtilityState();
}

class _SingleUtilityState extends State<SingleUtility> {
  ReviewCartProvider? reviewCartProvider;
  bool isadd = false;
  int count = 0;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);

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
                  child: Image.network(widget.productImage),
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
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
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
                      widget.isBool == false
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
                                      widget.productPrice.toString(),
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
                          : Text("${widget.productPrice} gram"),
                    ]),
              ),
            )),
        Expanded(
            flex: widget.isBool == false ? 1 : 2,
            child: Container(
                height: 90,
                padding: widget.isBool == false
                    ? EdgeInsets.symmetric(horizontal: 5, vertical: 32)
                    : EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 25,
                      ),
                margin: EdgeInsets.only(right: 5),
                child: widget.isBool == false
                    ? Center(
                        child: Row(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              size: 30,
                              color: primaryColor,
                            ),
                            onTap: () {
                              widget.onDelete();
                            },
                          )
                        ],
                      ))
                    : Center(
                        child: Column(children: [
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
                            child: Count(
                              productImage: widget.productImage,
                              productId: widget.id,
                              productName: widget.productName,
                            ),
                          ),
                        ),
                      ]))))
      ],
    );
  }
}
R