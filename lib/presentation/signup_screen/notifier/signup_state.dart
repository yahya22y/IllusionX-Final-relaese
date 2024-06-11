// ignore_for_file: must_be_immutable

part of 'signup_notifier.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.confirmpasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.signupModelObj,
  });

  TextEditingController? firstNameController;

  TextEditingController? lastNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  SignupModel? signupModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        firstNameController,
        lastNameController,
        emailController,
        passwordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        signupModelObj,
      ];

  SignupState copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
