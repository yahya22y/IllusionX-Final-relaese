import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:IllusionX/presentation/profile_screen/models/profile_model.dart';
part 'profile_state.dart';

final profileNotifier = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(ProfileState(
    firstNameController: TextEditingController(),
    lastNameController: TextEditingController(),
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    dateOfBirthController: TextEditingController(),
    selectedDropDownValue: SelectionPopupModel(title: ''),
    profileModelObj: ProfileModel(dropdownItemList: [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ]),
  )),
);

/// A notifier that manages the state of a Profile according to the event that is dispatched to it.
class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(ProfileState state) : super(state);
}
