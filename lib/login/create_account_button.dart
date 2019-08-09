/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 07:36:30 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-06 04:55:44
 */

import 'package:flutter/material.dart';
import 'package:sharpnote/repositories/user_repository.dart';
import 'package:sharpnote/src/screens/register.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
        style: TextStyle(color: Colors.white54),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
