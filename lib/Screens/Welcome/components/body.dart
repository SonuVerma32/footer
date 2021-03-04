import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footer/Components/roundedButton.dart';
import 'package:footer/Screens/Home/home.dart';
import 'package:footer/Screens/Login/loginScreen.dart';
import 'package:footer/Screens/SignUp/signUpScreen.dart';
import 'package:footer/Screens/Welcome/components/background.dart';
import 'package:footer/constants.dart';
import 'package:footer/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Body extends StatefulWidget {
  var vers;
  Body(this.vers);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

//  SharedPreferences spf;
//   String emaila;
//   loginStatus()async{
//     spf = await SharedPreferences.getInstance();
//         emaila = spf.getString("email");
//         print(emaila);
//      if(emaila != null){
//        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Home()));
//      }     
//     }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loginStatus();
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
              "Welcome to QuizSelf ",
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/online_test.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Login",
              press: () {
                getVersionApi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SignUp",
              color: vPrimaryLightColor,
              textColor: Colors.black,
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
            SizedBox(height: size.height * 0.04),
            Text(
              widget.vers.toString(),
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
