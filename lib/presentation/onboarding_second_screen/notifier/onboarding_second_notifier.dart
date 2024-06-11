import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/onboarding_second_model.dart';
part 'onboarding_second_state.dart';

final onboardingSecondNotifier =
    StateNotifierProvider<OnboardingSecondNotifier, OnboardingSecondState>(
  (ref) => OnboardingSecondNotifier(OnboardingSecondState(
    onboardingSecondModelObj: OnboardingSecondModel(),
  )),
);

/// A notifier that manages the state of a OnboardingSecond according to the event that is dispatched to it.
class OnboardingSecondNotifier extends StateNotifier<OnboardingSecondState> {
  OnboardingSecondNotifier(OnboardingSecondState state) : super(state);
}
