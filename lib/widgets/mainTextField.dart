import 'package:flutter/material.dart';

Function? validateFunc(value) => null;

TextFormField mainTextFormField({
  String labelText = 'Email',
  bool isobscure = false,
  TextInputType keyboardType = TextInputType.text,
  Function validator = validateFunc,
  required ThemeData theme,
  required TextEditingController textEditingController,
}) {
  return TextFormField(
    validator: (value) => validator(value!),
    controller: textEditingController,
    cursorColor: theme.colorScheme.secondary,
    keyboardAppearance: theme.brightness,
    keyboardType: keyboardType,
    obscureText: isobscure,
    cursorWidth: 3,
    style: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white.withOpacity(.7)),
      suffix: isobscure
          ? InkWell(
              onTap: () {
                print('suffixPressed');
              },
              child: Icon(Icons.remove_red_eye_outlined, color: Colors.white),
            )
          : null,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff545DBB),
          width: 2,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff545DBB),
          width: 2,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff545DBB),
          width: 2,
        ),
      ),
    ),
  );
}
