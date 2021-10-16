import 'dart:async';

import 'package:SanvikSystem/services/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      yield AuthenticationLoading();
      try {
        // a simulated delay
        final currentUser = await getUserData();

        if (currentUser != null) {
          yield AuthenticationAuthenticated(user: currentUser);
        } else {
          yield AuthenticationNotAuthenticated();
        }
      } catch (e) {
        yield AuthenticationFailure(message: 'An unknown error occurred');
      }
    }

    if (event is UserLoggedIn) {
      yield AuthenticationAuthenticated(user: event.user);
    }

    if (event is UserLoggedOut) {
      var res = await User().logoutUser().then((response) async* {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove("userSession");
      });

      yield AuthenticationNotAuthenticated();
    }
  }
}
