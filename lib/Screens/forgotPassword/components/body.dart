import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footer/Components/alreadyHaveAnAccountCheck.dart';
import 'package:footer/Components/roundedButton.dart';
import 'package:footer/Components/roundedInputField.dart';
import 'package:footer/Components/roundedPasswordField.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/Screens/Login/components/background.dart';
import 'package:footer/Screens/SignUp/signUpScreen.dart';
import 'package:footer/Screens/forgotPassword/forgotPasswordScreen.dart';
import 'package:footer/constants.dart';
import 'package:footer/home/homeScreen.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/forgot_password.svg",
                height: size.height * 0.30,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              //onChanged: (value) {},
              RoundedButton(
                text: "Next",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
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
}
