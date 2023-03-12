// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vegi_app/Models/product_model.dart';
import 'package:vegi_app/Providers/product_provider.dart';

import '../Screens/search_screen.dart';
import '../Drawer/drawerside.dart';
import '../Widgets/single_product.dart';

import '../Screens/Product_overview_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  ProductProvider? productProvider;
  void initState() {
    super.initState();
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchherbProducts();
    productProvider.fetchvegetableProducts();
    productProvider.fetchfruitsProducts();
  }

  Widget _buildHerb(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: SingalProduct(
          productImage: productImage,
          productName: productName,
          ontap: ontap,
          productPrice: productPrice),
    );
  }

  Widget _buildgrass(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: SingalProduct(
              productImage: productImage,
              productName: productName,
              ontap: ontap,
              productPrice: productPrice),
        ),
      ],
    );
  }

  Widget _buildroot(String productImage, String productName, int productPrice,
      VoidCallback? ontap) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: SingalProduct(
          productImage: productImage,
          productName: productName,
          ontap: ontap,
          productPrice: productPrice),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider? productProvider = Provider.of(context);
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: DrawerSide(),
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
              child: GestureDetector(
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 17,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Search(
                          searchList: productProvider!.getallProductList)));
                },
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fruits Seasoning',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      child: Text(
                        'view all',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Search(
                                  searchList: productProvider!.fruitProductList,
                                ))));
                      },
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                        children: productProvider!.fruitProductList
                            .map(
                              ((item) => _buildHerb(
                                      item.productImage!,
                                      item.productName!,
                                      item.productPrice!, () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductOverviewScreen(
                                                  productName:
                                                      item.productName!,
                                                  productImage:
                                                      item.productImage!,
                                                  productPrice:
                                                      item.productPrice!,
                                                )));
                                  })),
                            )
                            .toList()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Herbs Seasoning',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      child: Text(
                        'view all',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Search(
                                  searchList: productProvider.herbProductList,
                                ))));
                      },
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                        children: productProvider.herbProductList
                            .map(
                              ((item) => _buildgrass(
                                      item.productImage!,
                                      item.productName!,
                                      item.productPrice!, () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductOverviewScreen(
                                                  productName:
                                                      item.productName!,
                                                  productImage:
                                                      item.productImage!,
                                                  productPrice:
                                                      item.productPrice!,
                                                )));
                                  })),
                            )
                            .toList()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vegetable Seasoning',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      child: Text(
                        'view all',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Search(
                                  searchList:
                                      productProvider.vegetableProductList,
                                ))));
                      },
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                        children: productProvider.vegetableProductList
                            .map(
                              ((item) => _buildroot(
                                      item.productImage!,
                                      item.productName!,
                                      item.productPrice!, () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductOverviewScreen(
                                                  productName:
                                                      item.productName!,
                                                  productImage:
                                                      item.productImage!,
                                                  productPrice:
                                                      item.productPrice!,
                                                )));
                                  })),
                            )
                            .toList()),
                  ),
                ),
              ]),
            ])));
  }
}
