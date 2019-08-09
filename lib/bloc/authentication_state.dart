/*
 * @Author: MartinAk 
 * @Date: 2019-08-03 06:11:55 
 * @Last Modified by:   MartinAk 
 * @Last Modified time: 2019-08-03 06:11:55 
 */

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  final String displayName;

  Authenticated(this.displayName) : super([displayName]);

  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}

class InitialAuthenticationState extends AuthenticationState {}
