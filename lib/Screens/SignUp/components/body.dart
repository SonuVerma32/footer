import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footer/Components/alreadyHaveAnAccountCheck.dart';
import 'package:footer/Components/roundedButton.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/Screens/Home/home.dart';
import 'package:footer/Screens/Login/loginScreen.dart';
import 'package:footer/Screens/SignUp/components/background.dart';
import 'package:footer/Screens/SignUp/components/orDivider.dart';
import 'package:footer/Screens/SignUp/components/socialIcon.dart';
import 'package:footer/socialSignUP1.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../apis.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String url = "http://physicspedia.co.in/quiz-app/api/user/create";

  String email,password,name;

  void _signups()async{
    Map<String ,dynamic> dataa = {
      "name": "$name",
      "email": "$email",
      "password": "$password",
    };
    signUpApi(dataa).then((value) {
      var body = json.decode(value.body);
      if(body["status"] == true){
        print(value.body);
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context)=>Home()));
      }else{
        Fluttertoast.showToast(
            msg: body["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            //timeInSecForIosWeb: 1,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Text(
            "Sign Up",
            style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
          ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/press_play.svg",
              height: size.height * 0.28,
            ),
            SizedBox(height: size.height * 0.01),
            new TextFieldContainer(
                child: new TextField(
              keyboardType: TextInputType.text,
              onChanged: (val)=>name=val,
              decoration: InputDecoration(
                  icon: Icon(Icons.person, color: vPrimaryColor),
                  hintText: "Full Name",
                  border: InputBorder.none
              ),
            )),
            new TextFieldContainer(
              child: new TextField(
                onChanged: (val)=>email=val,
                decoration: InputDecoration(
                    icon: Icon(Icons.email, color: vPrimaryColor),
                    hintText: "Your Email",
                    border: InputBorder.none
                ),
              ),
            ),
            new TextFieldContainer(
              child: TextField(
                obscureText: isHiddenPassword,
                onChanged: (val)=>password=val,
                decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(Icons.lock,color: vPrimaryColor,
                    ),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        isHiddenPassword ? Icons.visibility_off : Icons.visibility,color: vPrimaryColor,
                      ),
                    ),
                    border: InputBorder.none
                ),
              ),
            ),
            RoundedButton(
              text: "Sign Up",
              press: () {
                _signups();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: (){
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();
                    },
                ),
                );
                },
            ),
          ],
        ),
      ),
    );
  }

  bool isHiddenPassword = true;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }


}

