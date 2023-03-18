// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';
import 'package:vegi_app/Providers/wishlist_provider.dart';
import 'package:vegi_app/Screens/review_cart_screen.dart';
import 'package:vegi_app/auth/sign_in.dart';

enum SiginCharacter { fill, outline }

class ProductOverviewScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;

  ProductOverviewScreen(
      {required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productId});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  SiginCharacter _character = SiginCharacter.fill;
  WishListProvider? wishListProvider;
  ReviewCartProvider? reviewCart;
  bool wishList = false;

  void getWishListbool() {
    FirebaseFirestore.instance
        .collection("WishListCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishList = value.get("wishList");
                      })
                    }
                }
            });
  }

  Widget ButtonNavigationBar(
      {Color? iconColor,
      Color? backgroundColor,
      Color? color,
      String? title,
      IconData? iconData,
      VoidCallback? onTap}) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            iconData,
            size: 17,
            color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: TextStyle(color: color),
          ),
        ]),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);

    getWishListbool();
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Row(children: [
          ButtonNavigationBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: 'Add to wishlist',
              iconData:
                  wishList ? Icons.favorite : Icons.favorite_border_outlined,
              onTap: () {
                print(wishList);
                setState(() {
                  wishList = !wishList;
                  if (wishList == true) {
                    wishListProvider?.addWishListData(
                        wishList: wishList,
                        wishListId: widget.productId,
                        wishListImage: widget.productImage,
                        wishListName: widget.productName,
                        wishListPrice: widget.productPrice,
                        wishListQuantity: 1);
                  } else {
                    print("I was runned");
                    wishListProvider?.getdeleted(widget.productId);
                  }
                });
              }),
          ButtonNavigationBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: 'Go to Cart',
              iconData: Icons.shop_outlined,
              onTap: (() => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReviewCart()))
                  }))
        ]),
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Product Overview",
            style: TextStyle(color: textColor),
          ),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text('\$${widget.productPrice}'),
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.productImage,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        'Available Options',
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                activeColor: Colors.green[700],
                                value: SiginCharacter.outline,
                                groupValue: _character,
                                onChanged: (value) {
                                  setState(() {
                                    _character = value as SiginCharacter;
                                  });
                                },
                              ),
                              Text("\$${widget.productPrice}"),
                            ]),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(children: [
                                Icon(Icons.add, size: 15, color: primaryColor),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: primaryColor,
                                ),
                              ]),
                            )
                          ]))
                ]),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About this Product",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "About this Product this product is very nice and very good at all place",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor),
                    )
                  ]),
            ))
          ],
        ));
  }
}
