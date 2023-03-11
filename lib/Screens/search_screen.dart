import 'package:flutter/material.dart';
import 'package:vegi_app/Config/Colors.dart';
import '../Widgets/single_utility.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
        SingleUtility(
          isBool: true,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
        SingleUtility(
          isBool: true,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
        SingleUtility(
          isBool: true,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 2,
        ),
        SingleUtility(
          isBool: true,
        ),
      ]),
    );
  }
}
