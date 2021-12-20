import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  List list;
  int index;
  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Detail Data " + widget.list[widget.index]['nama_promo']),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 8.0, right: 16.0, bottom: 1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 10,
                    color: Color.fromARGB(255, 21, 21, 21),
                    shadowColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Kode Promo = " +
                                      widget.list[widget.index]['kode_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Nama Promo = " +
                                      widget.list[widget.index]['nama_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Status Promo = " +
                                      widget.list[widget.index]['status_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Diskon Promo = " +
                                      widget.list[widget.index]['diskon_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Tanggal Mulai Promo = " +
                                      widget.list[widget.index]
                                          ['tgl_mulai_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  "Tanggal Selesai Promo = " +
                                      widget.list[widget.index]
                                          ['tgl_selesai_promo'],
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 25.0),
                        //   child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: <Widget>[
                        //         MaterialButton(
                        //           child: Text("Edit"),
                        //           color: Colors.blue,
                        //           onPressed: () => Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //                 builder: (BuildContext context) => Edit(
                        //                     list: widget.list,
                        //                     index: widget.index)),
                        //           ),
                        //         ),
                        //         MaterialButton(
                        //           child: Text("Delete"),
                        //           color: Colors.red,
                        //           onPressed: () {
                        //             confirm();
                        //           },
                        //         )
                        //       ]),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
