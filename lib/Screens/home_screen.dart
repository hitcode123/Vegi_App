// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Widgets/single_product.dart';
import '../Screens/Product_overview_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildHerb(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return SingalProduct(
        productImage: productImage,
        productName: productName,
        ontap: ontap,
        productPrice: productPrice);
  }

  Widget _buildgrass(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return SingalProduct(
        productImage: productImage,
        productName: productName,
        ontap: ontap,
        productPrice: productPrice);
  }

  Widget _buildroot(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return SingalProduct(
        productImage: productImage,
        productName: productName,
        ontap: ontap,
        productPrice: productPrice);
  }

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
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: Drawer(
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
                              "Login",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(width: 5))))),
                      )
                    ],
                  )
                ],
              )),
              Listtile(icon: Icons.home_outlined, title: "home"),
              Listtile(icon: Icons.shop_outlined, title: "Review Cart"),
              Listtile(icon: Icons.person_outline, title: "My Profile"),
              Listtile(
                  icon: Icons.notifications_outlined, title: "Notification"),
              Listtile(icon: Icons.star_outline, title: "Rating & Review"),
              Listtile(
                  icon: Icons.favorite_outline_outlined, title: "WishList"),
              Listtile(icon: Icons.copy_outlined, title: "Raise an Complain"),
              Listtile(icon: Icons.format_quote_outlined, title: "FAQs"),
              Container(
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffd6b738),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            CircleAvatar(
              backgroundColor: Color(0xffd6b738),
              radius: 12,
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffd6b738),
                child: Icon(
                  Icons.shop,
                  color: Colors.black,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ListView(children: [
              Column(children: [
                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.red,

                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnuNQIJMbNmzF1aPhM5faX_jce-4df6DQEAw&usqp=CAU')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              child: Column(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 157, bottom: 10),
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xffd1ad17),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Vegi',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.green,
                                            blurRadius: 10,
                                            offset: Offset(3, 3))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '30% Off',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.green[100],
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                'On all vegetables products',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]))),
                      Expanded(
                          child: Container(
                              child: Column(children: [
                        Row(
                          children: [],
                        )
                      ])))
                    ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasoning'),
                    Text(
                      'view all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(children: [
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasoning'),
                    Text(
                      'view all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(children: [
                      _buildgrass(
                          'https://w7.pngwing.com/pngs/1014/112/png-transparent-green-leaves-rosemary-herb-thymes-hair-herbs-food-people-grass-thumbnail.png',
                          'Grass',
                          20, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildgrass(
                          'https://w7.pngwing.com/pngs/1014/112/png-transparent-green-leaves-rosemary-herb-thymes-hair-herbs-food-people-grass-thumbnail.png',
                          'Grass',
                          20, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildgrass(
                          'https://w7.pngwing.com/pngs/1014/112/png-transparent-green-leaves-rosemary-herb-thymes-hair-herbs-food-people-grass-thumbnail.png',
                          'Grass',
                          20, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildgrass(
                          'https://w7.pngwing.com/pngs/1014/112/png-transparent-green-leaves-rosemary-herb-thymes-hair-herbs-food-people-grass-thumbnail.png',
                          'Grass',
                          20, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasoning'),
                    Text(
                      'view all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(children: [
                      _buildroot(
                          'https://png.pngtree.com/png-vector/20200916/ourmid/pngtree-organic-green-vegetable-mix-png-image_2344535.jpg',
                          'root',
                          47, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildroot(
                          'https://png.pngtree.com/png-vector/20200916/ourmid/pngtree-organic-green-vegetable-mix-png-image_2344535.jpg',
                          'root',
                          47, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildroot(
                          'https://png.pngtree.com/png-vector/20200916/ourmid/pngtree-organic-green-vegetable-mix-png-image_2344535.jpg',
                          'root',
                          47, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildroot(
                          'https://png.pngtree.com/png-vector/20200916/ourmid/pngtree-organic-green-vegetable-mix-png-image_2344535.jpg',
                          'root',
                          47, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasoning'),
                    Text(
                      'view all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(children: [
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                      _buildHerb(
                          'https://w7.pngwing.com/pngs/940/684/png-transparent-basil-italian-cuisine-pesto-pizza-herb-mint-leaf-vegetable-food-leaf-thumbnail.png',
                          'Herb',
                          30, () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductOverviewScreen()));
                      }),
                    ]),
                  ),
                ),
              ]),
            ])));
  }
}
