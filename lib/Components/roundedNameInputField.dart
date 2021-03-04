import 'package:flutter/material.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/constants.dart';

class RoundedNameInputField extends StatelessWidget {
  final String hintText;
  final IconData name;
  final ValueChanged<String> onChanged;
  const RoundedNameInputField({
    Key key,
    this.hintText,
    this.name = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(name, color: vPrimaryColor),
            hintText: hintText,
            border: InputBorder.none
        ),
      ),
    );
  }
}
