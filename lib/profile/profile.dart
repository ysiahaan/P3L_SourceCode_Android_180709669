import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final VoidCallback signOut;
  Profile(this.signOut);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = "",
      email = "",
      alamat = "",
      jk = "",
      no_telp = "",
      tgl_lahir = "",
      tgl_daftar = "",
      alergi = "",
      point = "";

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama_customer");
      email = preferences.getString("email_customer");
      alamat = preferences.getString("alamat_customer");
      jk = preferences.getString("jenis_kelamin_customer");
      no_telp = preferences.getString("notelp_customer");
      tgl_lahir = preferences.getString("tgl_lahir_customer");
      tgl_daftar = preferences.getString("tgl_pendaftaran_customer");
      alergi = preferences.getString("alergi_customer");
      point = preferences.getString("jumlah_point_customer");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile $nama"),
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
                                  "Nama = $nama",
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
                                  "Email = $email",
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
                                  "Alamat = $alamat",
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
                                  "Jenis Kelamin = $jk",
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
                                  "No Telepon = $no_telp",
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
                                  "Tanggal Pendaftaran = $tgl_daftar",
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
                                  "Alergi = $alergi",
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
                                  "Point = $point",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
