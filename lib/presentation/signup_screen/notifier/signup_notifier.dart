import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:IllusionX/presentation/signup_screen/models/signup_model.dart';
part 'signup_state.dart';

final signupNotifier = StateNotifierProvider<SignupNotifier, SignupState>(
  (ref) => SignupNotifier(SignupState(
    firstNameController: TextEditingController(),
    lastNameController: TextEditingController(),
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    confirmpasswordController: TextEditingController(),
    isShowPassword: false,
    isShowPassword1: false,
    signupModelObj: SignupModel(),
  )),
);

/// A notifier that manages the state of a Signup according to the event that is dispatched to it.
class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier(SignupState state) : super(state) {}

  void changePasswordVisibility() {
    state = state.copyWith(isShowPassword: !(state.isShowPassword));
  }

  void changePasswordVisibility1() {
    state = state.copyWith(isShowPassword1: !(state.isShowPassword1));
  }
}
