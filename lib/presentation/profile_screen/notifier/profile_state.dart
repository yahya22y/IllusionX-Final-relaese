// ignore_for_file: must_be_immutable

part of 'profile_notifier.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.dateOfBirthController,
    this.selectedDropDownValue,
    this.profileModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? dateOfBirthController;

  SelectionPopupModel? selectedDropDownValue;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameController,
        emailController,
        passwordController,
        dateOfBirthController,
        selectedDropDownValue,
        profileModelObj,
      ];

  ProfileState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? dateOfBirthController,
    SelectionPopupModel? selectedDropDownValue,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      dateOfBirthController:
          dateOfBirthController ?? this.dateOfBirthController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
