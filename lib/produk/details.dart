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
        title: Text("Detail Data " + widget.list[widget.index]['nama_produk']),
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
                                  "ID Produk = " +
                                      widget.list[widget.index]['id_produk'],
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
                                  "Nama Produk = " +
                                      widget.list[widget.index]['nama_produk'],
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
                                  "Keterangan = " +
                                      widget.list[widget.index]
                                          ['keterangan_produk'],
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
                                  "Satuan Produk = " +
                                      widget.list[widget.index]
                                          ['satuan_produk'],
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
                                  "Harga Produk = Rp " +
                                      widget.list[widget.index]['harga_produk'],
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
                                  "Ukuran Produk = " +
                                      widget.list[widget.index]
                                          ['ukuran_produk'],
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
                                  "Stok Produk = " +
                                      widget.list[widget.index]['stok_produk'],
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
