// ignore_for_file: must_be_immutable

part of 'forget_notifier.dart';

/// Represents the state of Forget in the application.
class ForgetState extends Equatable {
  ForgetState({
    this.emailController,
    this.forgetModelObj,
  });

  TextEditingController? emailController;

  ForgetModel? forgetModelObj;

  @override
  List<Object?> get props => [
        emailController,
        forgetModelObj,
      ];

  ForgetState copyWith({
    TextEditingController? emailController,
    ForgetModel? forgetModelObj,
  }) {
    return ForgetState(
      emailController: emailController ?? this.emailController,
      forgetModelObj: forgetModelObj ?? this.forgetModelObj,
    );
  }
}
