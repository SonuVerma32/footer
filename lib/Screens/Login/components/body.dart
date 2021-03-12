import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:footer/Components/alreadyHaveAnAccountCheck.dart';
import 'package:footer/Components/roundedButton.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/Screens/Home/home.dart';
import 'package:footer/Screens/Login/components/background.dart';
import 'package:footer/Screens/SignUp/components/orDivider.dart';
import 'package:footer/Screens/SignUp/components/socialIcon.dart';
import 'package:footer/Screens/SignUp/signUpScreen.dart';
import 'package:footer/Screens/forgotPassword/forgotPasswordScreen.dart';
import 'package:footer/apis.dart';
import 'package:footer/constants.dart';
import 'package:footer/socialSignUP1.dart';
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
                 SizedBox(
                   height: size.height * 0.03,
                 ),
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
                 OrDivider(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     SocialIcon(
                       iconSrc: "assets/icons/facebook-1.svg",
                       press: (){},
                     ),
                     SocialIcon(
                       iconSrc: "assets/icons/google-icon.svg",
                       press: (){
                         googleSignUp().then((value){
                           Map valdetail = {
                             "email" : value.email,
                             "auth_id" : value.uid,
                             "auth_from" : "google",
                             "device_token" : "",
                             "profile_pic" : value.photoURL
                           };
                           socialloginApi(valdetail).then((value){
                             var valjson = json.decode(value.body);
                             if(valjson["status"] == true && valjson["message"] == "Registered Successfully.."){
                               Fluttertoast.showToast(
                                   msg: valjson["message"],
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.BOTTOM,
                                   //timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.blueGrey,
                                   textColor: Colors.white,
                                   fontSize: 16.0
                               );
                               sharedPrefSetData(valjson);
                               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Home()));
                             }else{
                               sharedPrefSetData(valjson);
                               Fluttertoast.showToast(
                                   msg: "Email is Already Registered",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.BOTTOM,
                                   //timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.blueGrey,
                                   textColor: Colors.white,
                                   fontSize: 16.0
                               );
                               Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new Home()));

                             }
                           });
                         });
                       },
                     ),
                   ],
                 ),
                 SizedBox(
                   height: size.height * 0.01,
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
                 SizedBox(
                   height: size.height * 0.02,
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

  sharedPrefSetData(var valjson) async {
    var spfData;
    String Img = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b87d2841-ca20-4e28-819f-ac43f7bfe8ea/de5iyz9-7fd08074-0304-4e21-8186-3fc26f0599a9.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvYjg3ZDI4NDEtY2EyMC00ZTI4LTgxOWYtYWM0M2Y3YmZlOGVhXC9kZTVpeXo5LTdmZDA4MDc0LTAzMDQtNGUyMS04MTg2LTNmYzI2ZjA1OTlhOS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.LcwawI1u4j1iysbvZNNc6-kE1Ot7_-TVtqin4u9m3NU";
    String name, email, profile_pic;
    spfData = valjson["data"];
    print(spfData);
    name = spfData["name"];
    email = spfData["email"];
    profile_pic = spfData["profile_pic"];
    print(profile_pic);

    SharedPreferences spf = await SharedPreferences.getInstance();
    if(name != null){spf.setString("name","$name");}else{spf.setString("name","User");}
    if(email != null){spf.setString("email","$email");}else{spf.setString("email","User@mail.com");}
    if(profile_pic != null){spf.setString("profile_pic","$profile_pic");}else{spf.setString("profile_pic","$Img");}
  }
}
