import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();
  TextEditingController controllerImage = new TextEditingController();

  void addData() {
    var url = "http://localhost/PHP-REST-API/adddata.php";
    http.post(Uri.parse(url), body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
      "itemimage": controllerImage.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: new Text("ADD DATA"),
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
                  keyboardType: TextInputType.number,
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Enter Item Stock", labelText: "Item Stock"),
                  keyboardType: TextInputType.number,
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
                    addData();
                    Navigator.pop(context);
                    // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  child: Text("SAVE", style: TextStyle(fontSize: 12)),
                  // child: new Text("ADD DATA"),
                  // color: Colors.deepPurpleAccent,
                  // onPressed: () {
                  //   addData();
                  //   Navigator.pop(context);
                  //   // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                  // },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
