import 'package:flutter/material.dart';
import 'package:footer/sizeConfig.dart';

//const vPrimaryColor = Color(0xFF3EBACE);
const vPrimaryColor = Color(0xFF03A9F4);
//const vPrimaryLightColor = Color(0xFFD8ECF1);
const vPrimaryLightColor = Color(0xFFB3E5FC);
const vAccentColor = Color(0xFFF3F5F7);
const vCardColor = Color(0xFFB3E5FC);

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const vDefaultPadding = 20.0;


//const color = const Color(Colors.lightBlueAccent);


const vSecondaryColor = Color(0xFF979797);
const vTextColor = Color(0xFF757575);

const vAnimationDuration = Duration(milliseconds: 200);


// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String vEmailNullError = "Please Enter your email";
const String vInvalidEmailError = "Please Enter Valid Email";
const String vPassNullError = "Please Enter your password";
const String vShortPassError = "Password is too short";
const String vMatchPassError = "Passwords don't match";
const String vNamelNullError = "Please Enter your name";
const String vPhoneNumberNullError = "Please Enter your phone number";
const String vAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: vTextColor),
  );
}