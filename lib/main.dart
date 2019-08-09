/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 06:29:31 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 07:43:49
 */
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharpnote/bloc/bloc.dart';
import 'package:sharpnote/delegates/app_bloc_delegate.dart';
import 'package:sharpnote/repositories/user_repository.dart';
import 'package:sharpnote/src/screens/home.dart';
import 'package:sharpnote/src/screens/intro.dart';
import 'package:sharpnote/src/screens/splash.dart';

import 'bloc/authentication_bloc.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    backgroundColor: Color(0xff1D1A30),
    scaffoldBackgroundColor: Color(0xff1D1A30),
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarBrightness: Brightness.dark));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildDarkTheme(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return IntroScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          return null;
        },
      ),
    );
  }
}
