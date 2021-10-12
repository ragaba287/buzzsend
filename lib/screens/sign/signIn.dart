import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config.dart';
import '../../cubit/sign/signCubit.dart';
import '../../cubit/sign/signStates.dart';
import '../../screens/home/home.dart';
import '../../utils/constant.dart';
import '../../widgets/customPath.dart';
import '../../widgets/mainBtn.dart';
import '../../widgets/mainTextField.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignCubit, SignStates>(
      listener: (context, state) async {
        if (state is SignInSuccessState) {
          navPushRemove(context, HomeScreen());
          // await Sharedpreference.saveData( value: ,key: 'uId');
        }
      },
      builder: (context, state) {
        var theme = Theme.of(context);
        var cubit = SignCubit.get(context);
        TextEditingController emailTextEditing = TextEditingController();
        TextEditingController passwordTextEditing = TextEditingController();
        return Scaffold(
          body: Stack(
            children: [
              CutomPath(
                lightColor: theme.brightness == Brightness.light,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 180),
                      Text(
                        appName,
                        style: theme.textTheme.headline3!.copyWith(
                          color: Color(0xff545DBB),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome back!',
                        style: theme.textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 160),
                      mainTextFormField(
                        theme: theme,
                        keyboardType: TextInputType.emailAddress,
                        textEditingController: emailTextEditing,
                      ),
                      SizedBox(height: 20),
                      mainTextFormField(
                        labelText: 'Password',
                        theme: theme,
                        textEditingController: passwordTextEditing,
                        isobscure: true,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: theme.textTheme.headline6!.copyWith(
                              color: Color(0xff545DBB),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      MainButton(
                        onPressed: () {
                          cubit.userLogin(
                            email: emailTextEditing.text,
                            password: passwordTextEditing.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
