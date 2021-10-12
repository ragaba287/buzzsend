import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home/homeCubit.dart';
import '../../cubit/home/homeStates.dart';
import '../../screens/sign/splash.dart';
import '../../utils/constant.dart';
import '../../utils/sharedpreference.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var theme = Theme.of(context);
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
            title: Text(
              'Home',
              style: theme.textTheme.headline6!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  await Sharedpreference.removeData(key: 'uId');
                  navPushRemove(context, SplashScreen());
                },
                icon: Icon(Icons.notifications),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeNavBottom(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 't',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 't',
              ),
            ],
          ),
        );
      },
    );
  }
}
