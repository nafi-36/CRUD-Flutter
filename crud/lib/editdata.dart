import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;
  late TextEditingController controllerImage;

  void editData() {
    var url = "http://localhost/PHP-REST-API/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "itemimage": controllerImage.text
    });
  }

  @override
  void initState() {
    controllerCode =
        new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        new TextEditingController(text: widget.list[widget.index]['stock']);
    controllerImage = new TextEditingController(
        text: widget.list[widget.index]['item_image']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Code", labelText: "Item Code"),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Name", labelText: "Item Name"),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Price", labelText: "Item Price"),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Stock", labelText: "Item Stock"),
                ),
                new TextField(
                  controller: controllerImage,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Image URL",
                      labelText: "Item Image (URL)"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(20.0),
                ),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.deepPurple)),
                  // onPressed: () {},
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  child: Text("SAVE", style: TextStyle(fontSize: 12)),
                  // child: new Text("EDIT DATA"),
                  // color: Colors.deepPurpleAccent,
                  // onPressed: () {
                  //   editData();
                  //   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
