part of 'splash_one_notifier.dart';

/// Represents the state of SplashOne in the application.

// ignore_for_file: must_be_immutable
class SplashOneState extends Equatable {
  SplashOneState({this.splashOneModelObj});

  SplashOneModel? splashOneModelObj;

  @override
  List<Object?> get props => [splashOneModelObj];
  SplashOneState copyWith({SplashOneModel? splashOneModelObj}) {
    return SplashOneState(
      splashOneModelObj: splashOneModelObj ?? this.splashOneModelObj,
    );
  }
}
