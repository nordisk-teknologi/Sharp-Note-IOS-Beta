/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 06:48:14 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-03 06:50:13
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharpnote/bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).dispatch(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Welcome $name!')),
        ],
      ),
    );
  }
}
