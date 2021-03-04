import 'package:flutter/material.dart';
import 'package:footer/Screens/Welcome/components/body.dart';
import 'package:footer/apis.dart';
import 'dart:convert';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var vers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getversion();
  }
  _getversion(){
    getVersionApi().then((value) {
      var body = json.decode(value.body);
      var body2 = body["data"];
      setState(() {
        vers = body2["version"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(vers),
    );
  }
}
