import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    this.title = 'Login',
    this.onPressed,
    this.onlyBorder = false,
  });
  final String title;
  final Function? onPressed;
  final bool onlyBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: onlyBorder
            ? Border.all(
                color: Color(0xff545DBB),
                width: 3,
              )
            : null,
        gradient: !onlyBorder
            ? LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff383E7C),
                  Color(0xff545DBB),
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () => onPressed!(),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
