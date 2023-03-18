import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vegi_app/Config/Colors.dart';
import 'package:vegi_app/Drawer/drawerside.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  Widget Listtile({String? title, IconData? icon}) {
    return Column(
      children: [
        Divider(
          height: 2,
        ),
        ListTile(
          title: Text(title!),
          leading: Icon(icon),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: DrawerSide(),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('My profile Page'),
        ),
        body: Stack(children: [
          Column(children: [
            Container(
              height: 80,
              color: primaryColor,
            ),
            Container(
              height: 432,
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: ListView(children: [
                Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 16, left: 5),
                                child: Container(
                                  width: 175,
                                  height: 80,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "Mohit Kumar",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "M7870899267@gmail.com",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                      radius: 13, child: Icon(Icons.edit)),
                                ),
                              )
                            ]),
                      ),
                    ]),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 2,
                  ),
                ),
                Listtile(icon: Icons.shop_outlined, title: "My Orders"),
                Listtile(
                    icon: Icons.location_on_outlined,
                    title: "My Delivery Address"),
                Listtile(icon: Icons.person_outline, title: "Refer A Friends"),
                Listtile(
                    icon: Icons.file_copy_outlined,
                    title: "Terms & Conditions"),
                Listtile(icon: Icons.policy_outlined, title: "Privacy Policy"),
                Listtile(icon: Icons.add_chart, title: "About"),
                Listtile(icon: Icons.exit_to_app_outlined, title: "Log Out"),
                SizedBox(
                  height: 25,
                )
              ]),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 40),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: scaffoldBackgroundColor,
              child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      "https://png.pngtree.com/template/20190810/ourmid/pngtree-fresh-green-leaf-vegetable-logo-symbol-icon-image_292203.jpg")),
            ),
          )
        ]));
  }
}
