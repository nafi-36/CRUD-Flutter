import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import './detail.dart';
import './adddata.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "My Store",
    home: new Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    var url = "http://localhost/PHP-REST-API/getdata.php";

    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: new Text("EZ STORE"),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: new Icon(Icons.add),
        // onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
        //   builder: (BuildContext context) => new AddData(),
        // )),
        onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddData()))
            .then((value) => setState(() {})),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          height: 90,
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new Align(
                alignment: Alignment.center,
                child: new ListTile(
                  title: new Text(list[i]['item_name']),
                  // leading: new Icon(Icons.widgets),
                  leading: new Image.network(
                    list[i]['item_image'],
                    width: 60,
                    height: 60,
                  ),
                  subtitle: new Text("Stock : ${list[i]['stock']} available"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
