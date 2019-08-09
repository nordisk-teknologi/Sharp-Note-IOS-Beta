/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 07:30:20 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 07:41:02
 */

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: Color(0xFFFFFFFF),
      disabledTextColor: Color(0xFF8E8E93),
      color: Color(0xFF1D1A30),
      onPressed: _onPressed,
      child: Text('Login'),
    );
  }
}
