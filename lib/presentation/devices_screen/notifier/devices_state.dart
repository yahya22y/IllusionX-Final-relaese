// ignore_for_file: must_be_immutable

part of 'devices_notifier.dart';

/// Represents the state of Devices in the application.
class DevicesState extends Equatable {
  DevicesState({this.devicesModelObj});

  DevicesModel? devicesModelObj;

  @override
  List<Object?> get props => [
        devicesModelObj,
      ];

  DevicesState copyWith({DevicesModel? devicesModelObj}) {
    return DevicesState(
      devicesModelObj: devicesModelObj ?? this.devicesModelObj,
    );
  }
}
