import 'package:flutter/material.dart';
import '../../config.dart';
import '../../screens/sign/signIn.dart';
import '../../screens/sign/signUp.dart';
import '../../utils/constant.dart';
import '../../widgets/customPath.dart';
import '../../widgets/mainBtn.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CutomPath(addSVG: true),
            SizedBox(height: 50),
            Text(appName, style: theme.textTheme.headline3),
            SizedBox(height: 20),
            Text(
              'Lorem Ipsum is simply dummy\ntext of the printing and typeset.',
              style: theme.textTheme.headline6!.copyWith(
                color: Colors.white.withOpacity(.7),
              ),
            ),
            SizedBox(height: 50),
            MainButton(
              title: 'Login',
              onPressed: () => navPush(context, SignInScreen()),
            ),
            SizedBox(height: 30),
            MainButton(
              title: 'Sign up',
              onlyBorder: true,
              onPressed: () => navPush(context, SignUpScreen()),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
