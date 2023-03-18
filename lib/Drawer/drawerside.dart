import 'package:flutter/material.dart';
import 'package:vegi_app/Screens/wishlist_screen.dart';
import '../Screens/review_cart_screen.dart';

import '../Screens/home_screen.dart';
import '../Screens/my_profile_screen.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);
  Widget Listtile({IconData? icon, String? title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black38),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color(0xffd1ad17),
      child: ListView(children: [
        DrawerHeader(
            child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white54,
              radius: 43,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 40,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome"),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(width: 5))))),
                )
              ],
            )
          ],
        )),
        GestureDetector(
            child: Listtile(icon: Icons.home_outlined, title: "home"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()))),
        GestureDetector(
          child: Listtile(icon: Icons.shop_outlined, title: "Review Cart"),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ReviewCart())),
        ),
        GestureDetector(
            child: Listtile(icon: Icons.person_outline, title: "My Profile"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileView()))),
        Listtile(icon: Icons.notifications_outlined, title: "Notification"),
        Listtile(icon: Icons.star_outline, title: "Rating & Review"),
        GestureDetector(
          child: Listtile(
              icon: Icons.favorite_outline_outlined, title: "WishList"),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WishLIstScreen()));
          },
        ),
        Listtile(icon: Icons.copy_outlined, title: "Raise an Complain"),
        Listtile(icon: Icons.format_quote_outlined, title: "FAQs"),
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Contact Support"),
            SizedBox(
              height: 10,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Row(children: [
              Text("Call us"),
              SizedBox(
                width: 10,
              ),
              Text("+9123456676"),
            ]),
            SizedBox(
              height: 5,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Row(children: [
              Text("Mail us"),
              SizedBox(width: 10),
              Text("+9123456676"),
            ]),
          ]),
        )
      ]),
    ));
  }
}
