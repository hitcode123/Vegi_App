import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vegi_app/Config/Colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                      "https://thumbs.dreamstime.com/b/mixed-fresh-herbs-14544467.jpg"),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              height: 100,
              width: 130,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "productName",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          // ignore: prefer_const_constructors
                          Text(
                            "50\$/50 gram",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                "50 gram",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              )
                            ]),
                      ),
                    ]),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              height: 100,
              child: Icon(Icons.delete),
            ))
      ],
    );
  }
}
