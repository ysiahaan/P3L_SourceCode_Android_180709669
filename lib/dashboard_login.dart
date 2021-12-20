import 'package:flutter/material.dart';
import 'package:p3l_project/dashboard.dart';
import 'package:p3l_project/profile/profile.dart';
import 'package:p3l_project/widget/yesNoDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeLogin extends StatefulWidget {
  final VoidCallback signOut;
  HomeLogin({this.signOut});

  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  String nama = "", email = "", alamat = "";
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text("Natural Beauty Center")),
          backgroundColor: Colors.black,
          elevation: 5.0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 3.5 / 9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black45, Colors.black45],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width: 150.0,
                          height: 160.0,
                          child: Card(
                            color: Colors.black54,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new MaterialButton(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/profile.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      )
                                    ],
                                  ),
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Profile(signOut)))
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "$nama",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$email",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        "$alamat",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 12),
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.arrow_back),
                      onTap: () async {
                        final action = await Dialogs.yesAbortDialog(context,
                            'Sign Out', 'Are you sure you want to sign out?');
                        if (action == DialogAction.yes) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
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
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
