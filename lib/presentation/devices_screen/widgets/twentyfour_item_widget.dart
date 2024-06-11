import '../models/twentyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';

// ignore: must_be_immutable
class TwentyfourItemWidget extends StatelessWidget {
  TwentyfourItemWidget(
    this.twentyfourItemModelObj, {
    Key? key,
    this.onSelectedChipView1,
  }) : super(
          key: key,
        );

  TwentyfourItemModel twentyfourItemModelObj;

  Function(bool)? onSelectedChipView1;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 32.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        twentyfourItemModelObj.vRHeadset!,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 16.fSize,
          fontFamily: 'Futura Md BT',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (twentyfourItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.whiteA700,
      shadowColor: theme.colorScheme.secondaryContainer,
      elevation: 2,
      selectedColor: appTheme.whiteA700,
      shape: (twentyfourItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.6),
                width: 1.h,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13.h),
                topRight: Radius.circular(13.h),
                bottomRight: Radius.circular(13.h),
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13.h),
                topRight: Radius.circular(13.h),
                bottomRight: Radius.circular(13.h),
              ),
            ),
      onSelected: (value) {
        onSelectedChipView1?.call(value);
      },
    );
  }
}
