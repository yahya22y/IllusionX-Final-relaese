import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_model.dart';
part 'onboarding_state.dart';

final onboardingNotifier =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) => OnboardingNotifier(OnboardingState(
    onboardingModelObj: OnboardingModel(),
  )),
);

/// A notifier that manages the state of a Onboarding according to the event that is dispatched to it.
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(OnboardingState state) : super(state);
}
