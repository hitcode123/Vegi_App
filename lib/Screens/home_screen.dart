// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Widget SingleProduct() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9), borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Expanded(
            flex: 2,
            child: Image.network(
                'https://pngimg.com/uploads/spinach/spinach_PNG10.png')),
        // ignore: prefer_const_literals_to_create_immutables
        Expanded(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
            Text(
              'Fresh Basil',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              '50\$/50 Gram',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xffd9dad9),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            '50 Gram',
                            style: TextStyle(fontSize: 12),
                          )),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Color(0xffd6b738),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xffd9dad9),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Color(0xffd6b738),
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xffd6b738),
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Color(0xffd6b738),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: Drawer(),
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
                    child: Row(
                      children: [
                        SingleProduct(),
                        SingleProduct(),
                        SingleProduct(),
                        SingleProduct(),
                      ],
                    ),
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
                    child: Row(
                      children: [
                        SingleProduct(),
                        SingleProduct(),
                        SingleProduct(),
                        SingleProduct(),
                      ],
                    ),
                  ),
                ),
              ]),
            ])));
  }
}
