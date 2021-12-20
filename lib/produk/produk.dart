import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p3l_project/dashboard.dart';
import 'package:p3l_project/produk/details.dart';

class ProdukPage extends StatefulWidget {
  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  Future<List> getData() async {
    final response = await http.post(
        "http://36.85.3.6:80/ProjectP3L-app/app/api/produk/read_data.php");
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
          child: Text("Produk"),
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
            return DataProduk(list: snapshot.data, search: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DataProduk extends StatefulWidget {
  List list;
  List search;
  DataProduk({this.list, this.search});

  @override
  _DataProdukState createState() => _DataProdukState();
}

class _DataProdukState extends State<DataProduk> {
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
                        hintText: "Search by Nama Produk",
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
                          leading: Text(widget.list[i]['id_produk']),
                          title: Text(widget.list[i]['nama_produk']),
                          subtitle: Text(widget.list[i]['keterangan_produk']),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Details(list: widget.list, index: i),
                          )),
                        ),
                      )
                    : '${widget.list[i]['nama_produk']}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? Card(
                            child: ListTile(
                            leading: Text(widget.list[i]['id_produk']),
                            title: Text(widget.list[i]['nama_produk']),
                            subtitle: Text(widget.list[i]['keterangan_produk']),
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
