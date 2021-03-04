import 'package:flutter/material.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData email;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.email = Icons.email,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(email, color: vPrimaryColor),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }
}
