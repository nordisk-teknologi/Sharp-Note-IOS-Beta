/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 07:02:17 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 05:19:26
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharpnote/login/login_form.dart';
import 'package:sharpnote/repositories/user_repository.dart';
import 'package:sharpnote/login/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;
  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1A30),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          builder: (context) => LoginBloc(userRepository: _userRepository),
          child: LoginForm(userRepository: _userRepository),
        ),
      ),
    );
  }
}
