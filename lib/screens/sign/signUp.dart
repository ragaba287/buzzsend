import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/sign/signCubit.dart';
import '../../cubit/sign/signStates.dart';
import '../../screens/home/home.dart';
import '../../utils/constant.dart';
import '../../utils/sharedpreference.dart';
import '../../widgets/customPath.dart';
import '../../widgets/mainBtn.dart';
import '../../widgets/mainTextField.dart';

import '../../config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = SignCubit.get(context);
    var formKey = GlobalKey<FormState>();
    var usernameTextEdit = TextEditingController();
    var emailTextEdit = TextEditingController();
    var passwordTextEdit = TextEditingController();
    return BlocConsumer<SignCubit, SignStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Sharedpreference.saveData(key: 'uId', value: state.uId).then((value) {
            uId = state.uId!;
            navPush(context, HomeScreen());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              CutomPath(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 120),
                        Text(
                          appName,
                          style: theme.textTheme.headline3!.copyWith(
                            color: Color(0xff545DBB),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Sign up',
                          style: theme.textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 80),
                        mainTextFormField(
                          theme: theme,
                          textEditingController: usernameTextEdit,
                          keyboardType: TextInputType.text,
                          labelText: 'Full Name',
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Username Can\'t be Empty';
                          },
                        ),
                        SizedBox(height: 30),
                        mainTextFormField(
                          theme: theme,
                          textEditingController: emailTextEdit,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Email Can\'t be Empty';
                            else if (!value.contains('@'))
                              return 'Email not correct';
                          },
                        ),
                        SizedBox(height: 30),
                        mainTextFormField(
                          theme: theme,
                          textEditingController: passwordTextEdit,
                          labelText: 'Password',
                          isobscure: true,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'Password Can\'t be Empty';
                          },
                        ),
                        SizedBox(height: 50),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By continuing, you agree to our ',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: .7,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service ',
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontSize: 16,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: .5,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy policy',
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontSize: 16,
                                  letterSpacing: .5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        state is SignUpLoadingState
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.secondary,
                                ),
                              )
                            : MainButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                      name: usernameTextEdit.text,
                                      email: emailTextEdit.text,
                                      password: passwordTextEdit.text,
                                    );
                                  }
                                },
                                title: 'Sign up',
                              ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => navPop(context),
                            style: TextButton.styleFrom(
                              primary: theme.colorScheme.secondary,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Login',
                                    style: TextStyle(
                                      color: theme.colorScheme.secondary,
                                      fontSize: 16,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
