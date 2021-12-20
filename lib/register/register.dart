import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p3l_project/dashboard.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback signOut;
  RegisterPage(this.signOut);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = new GlobalKey<FormState>();
  String email,
      password,
      name,
      id,
      email_verified_at,
      remember_token,
      created_at,
      updated_at;

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      addData();
    }
  }

  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  bool _obsecureText = true;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void addData() {
    var url = "http://10.0.2.2:80/ProjectP3L-app/app/api/register/register.php";
    http.post(url, body: {
      // 'id': id,
      'name': name,
      'email': email,
      // 'email_verified_at': email_verified_at,
      'password': password,
      // 'remember_token': remember_token,
      // 'created_at': created_at,
      // 'updated_at': updated_at,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
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
                    width: 100,
                    height: 500,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/produk.png'),
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
                            "Register",
                            style: TextStyle(
                                color: Colors.brown,
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
                                      onSaved: (e) => email = e,
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return "Please Insert Email";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      onSaved: (e) => name = e,
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return "Please Insert Name";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Name",
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
                                      obscureText: _obsecureText,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter Your Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400]),
                                        suffixIcon: InkWell(
                                          onTap: _toggle,
                                          child: Icon(
                                            _obsecureText
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
                                    side: BorderSide(color: Color(0xff00c6ff))),
                                onPressed: () {
                                  check();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()));
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
                      ))
                ]),
              )
            ]),
          ),
        ),
      ),
    );
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
