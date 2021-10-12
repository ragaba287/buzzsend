import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home/homeCubit.dart';
import '../cubit/sign/signCubit.dart';
import '../screens/home/home.dart';
import '../screens/sign/splash.dart';
import '../utils/cubitObserver.dart';
import '../utils/sharedpreference.dart';
import '../utils/style/darkTheme.dart';
import '../utils/style/lightTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedpreference.init();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  uId = await Sharedpreference.getData(key: 'uId');

  Widget? homeWidget;
  if (uId != null)
    homeWidget = HomeScreen();
  else
    homeWidget = SplashScreen();

  runApp(MyApp(homeWidget));
}

class MyApp extends StatelessWidget {
  final Widget? homeWidget;
  MyApp(this.homeWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignCubit()),
        BlocProvider(
            create: (BuildContext context) => HomeCubit()..getUserDate()),
      ],
      child: MaterialApp(
        title: 'Social App',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: homeWidget,
        // home: HomeScreen(),
      ),
    );
  }
}
