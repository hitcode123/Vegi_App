import 'package:flutter/material.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';
import 'package:vegi_app/Providers/wishlist_provider.dart';
import 'package:vegi_app/Widgets/single_utility.dart';

import '../Models/product_model.dart';
import '../Models/review_cart_model.dart';

class WishLIstScreen extends StatefulWidget {
  @override
  State<WishLIstScreen> createState() => _WishLIstScreenState();
}

class _WishLIstScreenState extends State<WishLIstScreen> {
  WishListProvider? wishListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // print(delete);
    // set up the button
    Widget YesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider?.getdeleted(delete.productId!);

        Navigator.of(context).pop();
      },
    );
    Widget NoButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
      title: Text("Review Cart Screen"),
      // ignore: prefer_const_constructors
      content: Text("Do you want to delete the product"),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [NoButton, YesButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void delete(String? id) {
    wishListProvider!.getdeleted(id);
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of<WishListProvider>(context);
    wishListProvider?.getwishListData();
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Total Aount"),
          subtitle: Text(
            "\$ 170.00",
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text("Submit"),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Review Cart",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body: wishListProvider!.getwishList.isEmpty
            ? Center(child: Text("No data right now"))
            : ListView.builder(
                itemCount: wishListProvider!.getwishList.length,
                itemBuilder: ((context, index) {
                  // print(listProvider.listReviewCart.length);
                  ProductModel data = wishListProvider!.getwishList[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SingleUtility(
                        id: null,
                        isBool: false,
                        onDelete: () {
                          delete(data.productId);
                        },
                        productImage: data.productImage!,
                        productName: data.productName!,
                        productPrice: data.productPrice!,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  );
                })));
  }
}
