import 'package:flutter/material.dart';
import '../Widgets/single_utility.dart';
import '../Models/product_model.dart';

class Search extends StatefulWidget {
  // ignore: non_constant_identifier_names
  List<ProductModel> searchList;
  Search({required this.searchList});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  searchItem(String query) {
    List<ProductModel>? productsSearched = widget.searchList
        .where((element) => element.productName!.toLowerCase().contains(query))
        .toList();
    return productsSearched;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchList = searchItem(query);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
          child: Text("Search Items"),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
          child: Container(
            height: 42,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  hintText: "Enter Here to Search in  the Feild",
                  alignLabelWithHint: true,
                  fillColor: Color.fromARGB(255, 226, 218, 218),
                  filled: true,
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        Column(
          children: _searchList
              .map((productdata) => Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                      ),
                      SingleUtility(
                        isBool: true,
                        productImage: productdata.productImage!,
                        productName: productdata.productName!,
                        productPrice: productdata.productPrice!,
                      ),
                    ],
                  ))
              .toList(),
        )
      ]),
    );
  }
}
