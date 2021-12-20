import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:p3l_project/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BPR BKK Purbalingga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntoScreen(),
    );
  }
}

class IntoScreen extends StatefulWidget {
  @override
  _IntoScreenState createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
