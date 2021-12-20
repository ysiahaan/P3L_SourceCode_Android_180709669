import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p3l_project/dashboard.dart';
import 'package:p3l_project/promo/details.dart';

class PromoPage extends StatefulWidget {
  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  Future<List> getData() async {
    final response = await http
        .post("http://36.85.3.6:80/ProjectP3L-app/app/api/promo/read_data.php");
    return jsonDecode(response.body);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Promo"),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          )
        ],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.hasData) {
            return DataPromo(list: snapshot.data, search: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DataPromo extends StatefulWidget {
  List list;
  List search;
  DataPromo({this.list, this.search});

  @override
  _DataPromoState createState() => _DataPromoState();
}

class _DataPromoState extends State<DataPromo> {
  var loading = false;
  String filter;

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.black,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: "Search by Nama Promo",
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            new Expanded(
                child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, i) {
                return filter == null || filter == ""
                    ? Card(
                        child: ListTile(
                          leading: Text(widget.list[i]['kode_promo']),
                          title: Text(widget.list[i]['nama_promo']),
                          subtitle: Text(widget.list[i]['status_promo']),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Details(list: widget.list, index: i),
                          )),
                        ),
                      )
                    : '${widget.list[i]['nama_promo']}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? Card(
                            child: ListTile(
                            leading: Text(widget.list[i]['kode_promo']),
                            title: Text(widget.list[i]['nama_promo']),
                            subtitle: Text(widget.list[i]['status_promo']),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Details(list: widget.list, index: i),
                            )),
                          ))
                        : new Container();
              },
            ))
          ],
        ),
      ),
    );
  }
}
