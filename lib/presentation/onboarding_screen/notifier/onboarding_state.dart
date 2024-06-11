part of 'onboarding_notifier.dart';

/// Represents the state of Onboarding in the application.

// ignore_for_file: must_be_immutable
class OnboardingState extends Equatable {
  OnboardingState({this.onboardingModelObj});

  OnboardingModel? onboardingModelObj;

  @override
  List<Object?> get props => [onboardingModelObj];
  OnboardingState copyWith({OnboardingModel? onboardingModelObj}) {
    return OnboardingState(
      onboardingModelObj: onboardingModelObj ?? this.onboardingModelObj,
    );
  }
}
