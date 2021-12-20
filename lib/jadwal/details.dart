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
        title: Text("Detail Data " + widget.list[widget.index]['hari_jadwal']),
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
                                  "ID Jadwal = " +
                                      widget.list[widget.index]['id_jadwal'],
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
                                  "ID Pegawai = " +
                                      widget.list[widget.index]['pegawai_id'],
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
                                  "Hari = " +
                                      widget.list[widget.index]['hari_jadwal'],
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
                                  "Jam Mulai = " +
                                      widget.list[widget.index]
                                          ['jam_mulai_jadwal'],
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
                                  "Jam Selesai = " +
                                      widget.list[widget.index]
                                          ['jam_selesai_jadwal'],
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
                                  "Shift = " +
                                      widget.list[widget.index]['shift_jadwal'],
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
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "Keterangan ID Pegawai = ",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "1 = Anita ",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "2 = Becky",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "3 = Cherly",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "4 = Audy",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "5 = Cintya",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "6 = Dio",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "7 = Yuli",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            "8 = Martin",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.yellow),
                          ),
                        ),
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
