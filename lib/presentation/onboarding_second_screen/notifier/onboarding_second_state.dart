part of 'onboarding_second_notifier.dart';

/// Represents the state of OnboardingSecond in the application.

// ignore_for_file: must_be_immutable
class OnboardingSecondState extends Equatable {
  OnboardingSecondState({this.onboardingSecondModelObj});

  OnboardingSecondModel? onboardingSecondModelObj;

  @override
  List<Object?> get props => [onboardingSecondModelObj];
  OnboardingSecondState copyWith(
      {OnboardingSecondModel? onboardingSecondModelObj}) {
    return OnboardingSecondState(
      onboardingSecondModelObj:
          onboardingSecondModelObj ?? this.onboardingSecondModelObj,
    );
  }
}
