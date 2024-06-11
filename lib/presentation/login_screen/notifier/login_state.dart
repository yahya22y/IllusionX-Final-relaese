// ignore_for_file: must_be_immutable

part of 'login_notifier.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        loginModelObj,
      ];

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
