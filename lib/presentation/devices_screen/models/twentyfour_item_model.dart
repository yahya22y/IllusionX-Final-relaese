// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [twentyfour_item_widget] screen.
class TwentyfourItemModel extends Equatable {
  TwentyfourItemModel({
    this.vRHeadset,
    this.isSelected,
  }) {
    vRHeadset = vRHeadset ?? "VR Headset";
    isSelected = isSelected ?? false;
  }

  String? vRHeadset;

  bool? isSelected;

  TwentyfourItemModel copyWith({
    String? vRHeadset,
    bool? isSelected,
  }) {
    return TwentyfourItemModel(
      vRHeadset: vRHeadset ?? this.vRHeadset,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [vRHeadset, isSelected];
}
