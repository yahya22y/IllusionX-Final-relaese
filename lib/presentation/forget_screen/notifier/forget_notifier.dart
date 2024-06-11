import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:IllusionX/presentation/forget_screen/models/forget_model.dart';
part 'forget_state.dart';

final forgetNotifier = StateNotifierProvider<ForgetNotifier, ForgetState>(
  (ref) => ForgetNotifier(ForgetState(
    emailController: TextEditingController(),
    forgetModelObj: ForgetModel(),
  )),
);

/// A notifier that manages the state of a Forget according to the event that is dispatched to it.
class ForgetNotifier extends StateNotifier<ForgetState> {
  ForgetNotifier(ForgetState state) : super(state) {}
}
