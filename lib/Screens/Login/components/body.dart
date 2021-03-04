import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footer/Components/alreadyHaveAnAccountCheck.dart';
import 'package:footer/Components/roundedButton.dart';
import 'package:footer/Components/roundedInputField.dart';
import 'package:footer/Components/roundedPasswordField.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/Screens/Home/home.dart';
import 'package:footer/Screens/Login/components/background.dart';
import 'package:footer/Screens/SignUp/signUpScreen.dart';
import 'package:footer/Screens/forgotPassword/forgotPasswordScreen.dart';
import 'package:footer/apis.dart';
import 'package:footer/constants.dart';
import 'package:http/http.dart' as http;
import 'package:footer/home/homeScreen.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  bool remember = false;
  final _formKey = GlobalKey<FormState>();*/

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
  bool remember = false;
  String email,password;
  _logIn()async{
    Map<String ,dynamic> dataa = {
      "email": "$email",
      "password": "$password"
    };

    loginApi(dataa).then((value) async {
      var body = json.decode(value.body);
      if(body["status"] == true){
        print(value.body);
        // Code of Shared Preferences
        // TO Store Login Credentials and Status
        String name, email, profile_pic;
        var bod = body["data"];
        name = bod["name"];
        email = bod["email"];
        profile_pic = bod["profile_pic"];
        if (remember == true) {
          SharedPreferences spf = await SharedPreferences.getInstance();
          spf.setString("name","$name");
          spf.setString("email","$email");
          if (profile_pic != null) {
            spf.setString("profile_pic","$profile_pic");
          }
          else{
            spf.setString("profile_pic","https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b87d2841-ca20-4e28-819f-ac43f7bfe8ea/de5iyz9-7fd08074-0304-4e21-8186-3fc26f0599a9.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvYjg3ZDI4NDEtY2EyMC00ZTI4LTgxOWYtYWM0M2Y3YmZlOGVhXC9kZTVpeXo5LTdmZDA4MDc0LTAzMDQtNGUyMS04MTg2LTNmYzI2ZjA1OTlhOS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.LcwawI1u4j1iysbvZNNc6-kE1Ot7_-TVtqin4u9m3NU");
          }
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );

      }else{
       setState(() {
         showAlertDialog(context);
       });
      }
    });
  }
  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Wrong Credentials"),
      content: Text("Please Check Your Email And Password."),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );}

     @override
     void initState() {
       // TODO: implement initState
       super.initState();
     }
     @override
     Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
       return Background(
           child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   "Login",
                   style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                 ),
                 SizedBox(
                   height: size.height * 0.01,
                 ),
                 SvgPicture.asset(
                   "assets/icons/quitting_time.svg",
                   height: size.height * 0.35,
                 ),
                 SizedBox(
                   height: size.height * 0.04,
                 ),
                 TextFieldContainer(
                   child: TextField(
                     onChanged: (val)=>email=val,
                     decoration: InputDecoration(
                         icon: Icon(Icons.email, color: vPrimaryColor),
                         hintText: "Your Email",
                         border: InputBorder.none
                     ),
                   ),
                 ),
                 TextFieldContainer(
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
                 Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Checkbox(
                         value: remember,
                         activeColor: vPrimaryColor,
                         onChanged: (value) {
                           setState(() {
                             remember = value;
                           });
                         },
                       ),
                     ),
                     Text("Remember me"),
                     Spacer(),
                     GestureDetector(
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) {
                               return ForgotPasswordScreen();
                             },
                           ),
                         );
                       },
                       /*Navigator.pushNamed(context,
                        ForgotPasswordScreen.routeName),*/
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           "Forgot Password",
                           style: TextStyle(decoration: TextDecoration.underline),
                         ),
                       ),
                     )
                   ],
                 ),
                 RoundedButton(
                     text: "Login",
                     press: _logIn
                 ),
                 SizedBox(
                   height: size.height * 0.03,
                 ),
                 AlreadyHaveAnAccountCheck(
                   press: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) {
                           return SignUpScreen();
                         },
                       ),
                     );
                   },
                 ),
               ],
             ),
           ));
     }

     bool isHiddenPassword = true;
     void _togglePasswordView() {
       setState(() {
         isHiddenPassword = !isHiddenPassword;
       });
     }
}
