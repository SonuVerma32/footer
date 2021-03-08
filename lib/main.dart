import 'package:flutter/material.dart';
import 'package:footer/Screens/Home/home.dart';
import 'package:footer/Screens/Home/homeScreen.dart';
import 'package:footer/Screens/Welcome/welcomeScreen.dart';
import 'package:footer/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'apis.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  bool status1 = false;
  SharedPreferences spf;
  loginStatus()async{
    try{
      spf = await SharedPreferences.getInstance();
      String emaila = spf.getString("email");
      if(emaila != null){
        setState(() {
          status1 = true;
        });
      }
    } catch(e){
      setState(() {
        status1 = false;
      });
    }
    }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    loginStatus();
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizSelf',
      theme: ThemeData(
        primaryColor: vPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: status1 == true ? Home() : WelcomeScreen(),
    );
  }
}
