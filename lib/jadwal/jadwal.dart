import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p3l_project/dashboard.dart';
import 'package:p3l_project/jadwal/details.dart';

class JadwalPage extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  Future<List> getData() async {
    final response = await http.post(
        "http://36.85.3.6:80/ProjectP3L-app/app/api/jadwal/read_data.php");
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
          child: Text("Jadwal"),
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
            return DataJadwal(list: snapshot.data, search: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DataJadwal extends StatefulWidget {
  List list;
  List search;
  DataJadwal({this.list, this.search});

  @override
  _DataJadwalState createState() => _DataJadwalState();
}

class _DataJadwalState extends State<DataJadwal> {
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
                        hintText: "Search by hari", border: InputBorder.none),
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
                          leading: Icon(Icons.line_style),
                          title: Text(widget.list[i]['hari_jadwal']),
                          subtitle: Text(widget.list[i]['jam_mulai_jadwal']),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Details(list: widget.list, index: i),
                          )),
                        ),
                      )
                    : '${widget.list[i]['hari_jadwal']}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                        ? Card(
                            child: ListTile(
                            leading: Icon(Icons.line_style),
                            title: Text(widget.list[i]['hari_jadwal']),
                            subtitle: Text(widget.list[i]['jam_mulai_jadwal']),
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
