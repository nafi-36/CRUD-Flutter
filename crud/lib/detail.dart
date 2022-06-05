import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import './editdata.dart';
import './main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://localhost/PHP-REST-API/deleteData.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  // void confirm() {
  // AlertDialog alertDialog = AlertDialog(
  //   title: Text("Delete Confirm"),
  //   content: Container(
  //     child: Text("Are You sure want to delete '${widget.list[widget.index]['item_name']}'"),
  //   ),
  //   // actions: [
  //   //   TextButton(
  //   //     child: Text('Ok'),
  //   //     onPressed: () => Navigator.of(context).pop(),
  //   //   ),
  //   // ],
  //   actions: <Widget>[
  //     new RaisedButton(
  //       child: new Text(
  //         "OK DELETE!",
  //         style: new TextStyle(color: Colors.black),
  //       ),
  //       color: Colors.red,
  //       onPressed: () {
  //         deleteData();
  //         Navigator.of(context).push(new MaterialPageRoute(
  //           builder: (BuildContext context) => new Home(),
  //         ));
  //       },
  //     ),
  //     new RaisedButton(
  //       child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
  //       color: Colors.green,
  //       onPressed: () => Navigator.pop(context),
  //     ),
  //   ],
  // );

  // showDialog(context: context, builder: (context) => alertDialog);
  // return;
  // AlertDialog alertDialog = new AlertDialog(
  //   content: new Text("Are You sure want to delete '${widget.list[widget.index]['item_name']}'"),
  //   actions: <Widget>[
  //     new RaisedButton(
  //       child: new Text(
  //         "OK DELETE!",
  //         style: new TextStyle(color: Colors.black),
  //       ),
  //       color: Colors.red,
  //       onPressed: () {
  //         deleteData();
  //         Navigator.of(context).push(new MaterialPageRoute(
  //           builder: (BuildContext context) => new Home(),
  //         ));
  //       },
  //     ),
  //     new RaisedButton(
  //       child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
  //       color: Colors.green,
  //       onPressed: () => Navigator.pop(context),
  //     ),
  //   ],
  // );

  // showDialog(
  //     context: context,
  //     // child: alertDialog
  //     builder: (context) => AlertDialog(content: alertDialog));

  // }

  void confirm(BuildContext context) {
    Alert(
      context: context,
      // type: AlertType.success,
      title: "Delete Confirm",
      content: Text(
        "Are You sure want to delete '${widget.list[widget.index]['item_name']}?'",
        style: TextStyle(color: Colors.black, fontSize: 13),
        textAlign: TextAlign.center,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "YES",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          color: Colors.deepPurple,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ));
          },
        ),
        DialogButton(
          child: Text(
            "NO",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ).show();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.deepPurple,
          title: new Text("${widget.list[widget.index]['item_name']}")),
      body: new Container(
        // height: 500.0,
        padding: const EdgeInsets.all(20.0),
        // child: new Card(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Image.network(
                widget.list[widget.index]['item_image'],
                width: 150,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Text(
                "${widget.list[widget.index]['item_code']} - ${widget.list[widget.index]['stock']} available",
                style:
                    new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
              ),
              new Text(
                widget.list[widget.index]['item_name'],
                style:
                    new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              new Text(
                "Rp ${widget.list[widget.index]['price']},-",
                style:
                    new TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
              ),
              // new Text(
              //   "Stock : ${widget.list[widget.index]['stock']}",
              //   style: new TextStyle(fontSize: 18.0),
              // ),
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.deepPurple)),
                    // onPressed: () {},
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                    padding: EdgeInsets.all(10.0),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    child: Text("EDIT", style: TextStyle(fontSize: 12)),
                    // child: new Text("EDIT"),
                    // color: Colors.green,
                    // onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                    //   builder: (BuildContext context) => new EditData(
                    //     list: widget.list,
                    //     index: widget.index,
                    //   ),
                    // )),
                  ),
                  new SizedBox(
                    width: 10,
                  ),
                  new RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.deepPurple)),
                    // onPressed: () {},
                    onPressed: () => confirm(context),
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    textColor: Colors.deepPurple,
                    child: Text("DELETE", style: TextStyle(fontSize: 12)),
                    // child: new Text("DELETE"),
                    // color: Colors.red,
                    // onPressed: () => confirm(context),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
