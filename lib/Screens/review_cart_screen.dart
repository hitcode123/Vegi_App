import 'package:flutter/material.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:provider/provider.dart';
import 'package:vegi_app/Providers/review_cart_provider.dart';
import 'package:vegi_app/Widgets/single_utility.dart';

import '../Models/review_cart_model.dart';

class ReviewCart extends StatelessWidget {
  ReviewCartProvider? listProvider;

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // print(delete);
    // set up the button
    Widget YesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        listProvider?.deleteReviewCart(delete.cartId!);

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

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ReviewCartProvider>(context);
    listProvider?.getReviewCartData();
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
        body: listProvider!.listReviewCart.isEmpty
            ? Center(child: Text("No data right now"))
            : ListView.builder(
                itemCount: listProvider!.listReviewCart.length,
                itemBuilder: ((context, index) {
                  // print(listProvider.listReviewCart.length);
                  ReviewCartModel data = listProvider!.listReviewCart[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SingleUtility(
                        isBool: false,
                        onDelete: () {
                          showAlertDialog(context, data);
                        },
                        productImage: data.cartImage!,
                        productName: data.cartName!,
                        productPrice: data.cartPrice!,
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
