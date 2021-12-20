import 'package:flutter/material.dart';
import 'package:p3l_project/jadwal/jadwal.dart';
import 'package:p3l_project/login/login.dart';
import 'package:p3l_project/perawatan/perawatan.dart';
import 'package:p3l_project/produk/produk.dart';
import 'package:p3l_project/promo/promo.dart';
import 'package:p3l_project/register/register.dart';

class HomePage extends StatefulWidget {
  final VoidCallback signOut;
  HomePage({this.signOut});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text("Dashboard")),
          backgroundColor: Colors.black,
          elevation: 5.0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Welcome ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
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
                            color: Color.fromARGB(255, 21, 21, 21),
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
                                        "assets/images/jadwal.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Jadwal",
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
                                            builder: (context) => JadwalPage()))
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
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
                                        "assets/images/produk.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Produk",
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
                                            builder: (context) => ProdukPage()))
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
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
                                        "assets/images/promo.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Promo",
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
                                            builder: (context) => PromoPage()))
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
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
                                        "assets/images/perawatan.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Perawatan",
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
                                                PerawatanPage()))
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
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
                                        "assets/images/login.png",
                                        width: 60.0,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        "Login",
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
                                            builder: (context) => LoginPage()))
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
        )),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Center(child: Text("Dashboard")),
//         backgroundColor: Colors.black,
//         elevation: 5.0,
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Text(
//                 "Welcome ",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Center(
//                   child: Wrap(
//                     spacing: 20.0,
//                     runSpacing: 20.0,
//                     children: <Widget>[
//                       SizedBox(
//                         width: 150.0,
//                         height: 160.0,
//                         child: Card(
//                           color: Color.fromARGB(255, 21, 21, 21),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: new MaterialButton(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Image.asset(
//                                       "assets/images/jadwal.png",
//                                       width: 60.0,
//                                     ),
//                                     SizedBox(
//                                       height: 20.0,
//                                     ),
//                                     Text(
//                                       "Jadwal",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15.0),
//                                     )
//                                   ],
//                                 ),
//                                 onPressed: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => JadwalPage()))
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 150.0,
//                         height: 160.0,
//                         child: Card(
//                           color: Color.fromARGB(255, 21, 21, 21),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: new MaterialButton(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Image.asset(
//                                       "assets/images/produk.png",
//                                       width: 60.0,
//                                     ),
//                                     SizedBox(
//                                       height: 20.0,
//                                     ),
//                                     Text(
//                                       "Produk",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15.0),
//                                     )
//                                   ],
//                                 ),
//                                 onPressed: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ProdukPage()))
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 150.0,
//                         height: 160.0,
//                         child: Card(
//                           color: Color.fromARGB(255, 21, 21, 21),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: new MaterialButton(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Image.asset(
//                                       "assets/images/promo.png",
//                                       width: 60.0,
//                                     ),
//                                     SizedBox(
//                                       height: 20.0,
//                                     ),
//                                     Text(
//                                       "Promo",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15.0),
//                                     )
//                                   ],
//                                 ),
//                                 onPressed: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => PromoPage()))
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 150.0,
//                         height: 160.0,
//                         child: Card(
//                           color: Color.fromARGB(255, 21, 21, 21),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: new MaterialButton(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Image.asset(
//                                       "assets/images/perawatan.png",
//                                       width: 60.0,
//                                     ),
//                                     SizedBox(
//                                       height: 20.0,
//                                     ),
//                                     Text(
//                                       "Perawatan",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15.0),
//                                     )
//                                   ],
//                                 ),
//                                 onPressed: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               PerawatanPage()))
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 150.0,
//                         height: 160.0,
//                         child: Card(
//                           color: Color.fromARGB(255, 21, 21, 21),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: new MaterialButton(
//                                 child: Column(
//                                   children: <Widget>[
//                                     Image.asset(
//                                       "assets/images/perawatan.png",
//                                       width: 60.0,
//                                     ),
//                                     SizedBox(
//                                       height: 20.0,
//                                     ),
//                                     Text(
//                                       "Login / Register",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15.0),
//                                     )
//                                   ],
//                                 ),
//                                 onPressed: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               RegisterPage(signOut)))
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       )),
//     );
//   }
// }
