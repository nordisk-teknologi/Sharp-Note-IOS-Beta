/*
 * @Author: MartinAk 
 * @Date: 2019-08-06 04:34:28 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 04:57:15
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharpnote/repositories/user_repository.dart';
import 'package:sharpnote/src/screens/login.dart';

class NavigateToLoginButton extends StatelessWidget {
  final UserRepository _userRepository;

  NavigateToLoginButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          color: Color(0xFF007AFF),
          textColor: Colors.white,
          child: Text(
            'Login',
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return LoginScreen(userRepository: _userRepository);
              }),
            );
          },
        ),
      ),
    );
  }
}
