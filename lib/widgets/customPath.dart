import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CutomPath extends StatelessWidget {
  CutomPath({
    this.addSVG = false,
    this.lightColor = false,
  });
  final bool addSVG;
  final bool lightColor;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        color: lightColor
            ? Theme.of(context).colorScheme.primary.withOpacity(.15)
            : Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.all(55),
        child: addSVG
            ? SvgPicture.asset(
                Theme.of(context).brightness == Brightness.light
                    ? 'assets/sign/hey_light.svg'
                    : 'assets/sign/hey_dark.svg',
              )
            : null,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * .5);
    path.cubicTo(
      size.width * .80,
      size.height * .9,
      size.width * .5,
      size.height * 1.15,
      0,
      size.height * .9,
    );
    path.lineTo(0, size.height * .9);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
