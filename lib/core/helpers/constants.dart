import 'package:flutter/material.dart';

const kDefaultPadding = 16.0;

Widget sh(double val) {
  return SizedBox(height: val);
}

Widget sw(double val) {
  return SizedBox(width: val);
}

double dh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double dw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const kPrimaryColor = Color(0xFFFF7643);
const kChatColor = Color.fromARGB(255, 250, 148, 111);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp nameValidatorRegExp =
    RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid Email';
const String kInvalidNameError = 'Please Enter Valid name';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kAddressNullError = 'Please Enter your address';

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}

const double kDefaultpadding = 20;
