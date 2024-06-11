// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:IllusionX/core/app_export.dart';

/// This class defines the variables used in the [profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel extends Equatable {
  ProfileModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  ProfileModel copyWith({List<SelectionPopupModel>? dropdownItemList}) {
    return ProfileModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
