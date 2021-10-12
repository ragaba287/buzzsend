import 'package:flutter/material.dart';

void navPush(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

void navPushRemove(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

void navPop(BuildContext context) {
  Navigator.of(context).pop();
}
