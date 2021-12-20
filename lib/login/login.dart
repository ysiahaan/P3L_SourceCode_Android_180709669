import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p3l_project/dashboard.dart';
import 'package:p3l_project/dashboard_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum LoginStatus { notSignIn, signIn }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String msgError = "";
  bool _obscureText = true;
  String id, password;
  final _key = new GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  toast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final res = await http.post(
        "http://36.85.3.6:80/ProjectP3L-app/app/api/login/login.php",
        body: {
          "id_customer": id,
          "tgl_lahir_customer": password,
        });
    final data = jsonDecode(res.body);
    int value = data['value'];
    String message = data['message'];
    String nama = data['nama_customer'];
    String email = data['email_customer'];
    String alamat = data['alamat_customer'];
    String no_telp = data['notelp_customer'];
    String jenis_kelamin = data['jenis_kelamin_customer'];
    String tgl_pendaftaran = data['tgl_pendaftaran_customer'];
    String alergi = data['alergi_customer'];
    String point = data['jumlah_point_customer'];

    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;

        msgError = "";
        savePref(value, nama, email, alamat, no_telp, jenis_kelamin,
            tgl_pendaftaran, alergi, point);
      });
      print(message);
      toast(message);
    } else {
      setState(() {
        msgError = "Username atau Password salah !";
      });
      print(message);
      toast(message);
    }
  }

  savePref(
      int value,
      String nama,
      String email,
      String alamat,
      String no_telp,
      String jenis_kelamin,
      String tgl_pendaftaran,
      String alergi,
      String point) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama_customer", nama);
      preferences.setString("email_customer", email);
      preferences.setString("alamat_customer", alamat);
      preferences.setString("notelp_customer", no_telp);
      preferences.setString("jenis_kelamin_customer", jenis_kelamin);
      preferences.setString("tgl_pendaftaran_customer", tgl_pendaftaran);
      preferences.setString("alergi_customer", alergi);
      preferences.setString("jumlah_point_customer", point);
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      _loginStatus = LoginStatus.notSignIn;
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
    switch (_loginStatus) {
      case LoginStatus.signIn:
        return HomeLogin();
        break;

      case LoginStatus.notSignIn:
        return Scaffold(
          body: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Stack(children: <Widget>[
                      ClipPath(
                        clipper: ClippingClass(),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black45, Colors.black],
                                begin: Alignment.topLeft,
                                end: Alignment.center),
                          ),
                          height: MediaQuery.of(context).size.height / 2.2,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 60),
                        width: 450,
                        height: 300,
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage('assets/images/login.png'),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 325,
                          left: 80,
                          child: Container(
                            //margin: EdgeInsets.only(top: 120),
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 350),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: TextFormField(
                                        onSaved: (e) => id = e,
                                        validator: (e) {
                                          if (e.isEmpty) {
                                            return "Please Insert ID";
                                          }
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter Your ID",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        onSaved: (e) => password = e,
                                        validator: (e) {
                                          if (e.isEmpty) {
                                            return "Please Insert Password";
                                          }
                                        },
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          suffixIcon: InkWell(
                                            onTap: _toggle,
                                            child: Icon(
                                              _obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              size: 26.0,
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Color(0xff00c6ff))),
                                  onPressed: () {
                                    check();
                                  },
                                  color: Colors.brown[600],
                                  textColor: Colors.white,
                                  child: Text("Sign In"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            )),
          ),
        );
        break;
    }
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    //creating first curver near bottom left corner
    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    //creating second curver near center
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    //creating third curver near top right corner
    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move to top right corner
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
