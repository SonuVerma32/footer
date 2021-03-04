import 'package:flutter/material.dart';
import 'package:footer/Components/textFieldContainer.dart';
import 'package:footer/constants.dart';

/*class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);*/

class RoundedPasswordField extends StatefulWidget {
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isHiddenPassword,
        //onChanged: onChanged,
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
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
