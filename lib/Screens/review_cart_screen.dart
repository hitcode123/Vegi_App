import 'package:flutter/material.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Widgets/single_utility.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Review Cart",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            // SingleUtility(
            //   isBool: false,
            // ),
            // SingleUtility(
            //   isBool: false,
            // ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
