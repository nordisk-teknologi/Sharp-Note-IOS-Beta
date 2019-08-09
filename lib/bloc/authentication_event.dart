/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 06:11:48 
 * @Last Modified by: MartinAk
 * @Last Modified time: 2019-08-03 06:12:39
 */

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
