import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_title.dart';
import 'models/twentyfour_item_model.dart';
import '../devices_screen/widgets/twentyfour_item_widget.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:IllusionX/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'notifier/devices_notifier.dart';

class DevicesScreen extends ConsumerStatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  DevicesScreenState createState() => DevicesScreenState();
}

class DevicesScreenState extends ConsumerState<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEight(context),
                      SizedBox(height: 42.v),
                      Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text("lbl_other_devices".tr,
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 31.v),
                      _buildTwentyFour(context),
                      SizedBox(height: 76.v),
                      CustomElevatedButton(
                        height: 50.h,
                        text: "lbl_add_a_device".tr,
                        margin: EdgeInsets.only(left: 7.h, right: 8.h),
                        buttonStyle:
                            CustomButtonStyles.outlineSecondaryContainer,
                        decoration: AppDecoration.outlineSecondaryContainer1
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder11),
                      )
                    ])),
            bottomNavigationBar: _buildThirtyTwo(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
            onTap: () {
              onTapBtnUser(context);
            },
            margin: EdgeInsets.only(left: 21.h, top: 15.v, bottom: 16.v)),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_devices".tr,
        ));
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Container(
        width: 330.h,
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 23.v),
        decoration: AppDecoration.gradientIndigoAToBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder35),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Text("lbl_current_device".tr,
                      style: CustomTextStyles.bodyMediumFuturaMdBTWhiteA700)),
              SizedBox(height: 18.v),
              Text("lbl_realwatch".tr,
                  style: CustomTextStyles.headlineLargeWhiteA700),
              SizedBox(height: 26.v)
            ]));
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Wrap(
          runSpacing: 31.v,
          spacing: 31.h,
          children: List<Widget>.generate(
              ref
                      .watch(devicesNotifier)
                      .devicesModelObj
                      ?.twentyfourItemList
                      .length ??
                  0, (index) {
            TwentyfourItemModel model = ref
                    .watch(devicesNotifier)
                    .devicesModelObj
                    ?.twentyfourItemList[index] ??
                TwentyfourItemModel();
            return TwentyfourItemWidget(model, onSelectedChipView1: (value) {
              ref
                  .read(devicesNotifier.notifier)
                  .onSelectedChipView1(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildThirtyTwo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 21.h, bottom: 12.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnHome(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgHome))),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnUser(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgUser))),
          CustomElevatedButton(
              height: 32.v,
              width: 153.h,
              decoration: AppDecoration.outlineSecondaryContainer1
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
              text: "lbl_devices".tr,
              margin: EdgeInsets.only(left: 23.h, top: 5.v, bottom: 3.v),
              leftIcon: Container(
                  margin: EdgeInsets.only(right: 30.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgGrid, height: 20.v)),
              buttonTextStyle: theme.textTheme.titleSmall!),
          Padding(
              padding: EdgeInsets.only(left: 24.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(4.h),
                  onTap: () {
                    onTapBtnSettings(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgSearch)))
        ]));
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatbotScreen,
    );
  }

  onTapBtnSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
