// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'twentyfour_item_model.dart';

/// This class defines the variables used in the [devices_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DevicesModel extends Equatable {
  DevicesModel({this.twentyfourItemList = const []}) {}

  List<TwentyfourItemModel> twentyfourItemList;

  DevicesModel copyWith({List<TwentyfourItemModel>? twentyfourItemList}) {
    return DevicesModel(
      twentyfourItemList: twentyfourItemList ?? this.twentyfourItemList,
    );
  }

  @override
  List<Object?> get props => [twentyfourItemList];
}
