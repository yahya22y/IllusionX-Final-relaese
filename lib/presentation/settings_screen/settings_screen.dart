import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_title.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:IllusionX/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 6.h, right: 85.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgProfilePicture,
                                height: 115.v,
                                width: 124.h,
                                radius: BorderRadius.circular(25.h)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 14.h, top: 45.v, bottom: 45.v),
                                child: Text("Peter Parker".tr,
                                    style:
                                        CustomTextStyles.bodyLargeFuturaHvBT))
                          ])),
                      SizedBox(height: 28.v),
                      _buildTwentyEight(context),
                      SizedBox(height: 30.v),
                      _buildAppSettings(context),
                      SizedBox(height: 30.v),
                      _buildAboutUs(context),
                      SizedBox(height: 30.v),
                      _buildContactUs(context),
                      SizedBox(height: 30.v),
                      _buildLogOut(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildTwentyThree(context)));
  }

  /// Section Widget APP BAR
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
            onTap: () {
              onTapBtnInbox(context);
            },
            margin: EdgeInsets.only(left: 21.h, top: 14.v, bottom: 17.v)),
        centerTitle: true,
        title: AppbarTitle(
          text: "lbl_settings".tr,
        ));
  }

  Widget _buildTwentyEight(BuildContext context) {
    return CustomElevatedButton(
        height: 50.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_profile".tr,
        margin: EdgeInsets.only(left: 2.h),
        onPressed: () {
          onTapBtnprofile(context);
        },
        leftIcon: Container(
            margin: EdgeInsets.only(right: 70.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgProfilee,
                height: 29.v,
                width: 25.h)));
  }

  /// Section Widget
  Widget _buildAppSettings(BuildContext context) {
    return CustomElevatedButton(
        height: 50.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_app_settings".tr,
        margin: EdgeInsets.only(left: 2.h),
        onPressed: (() {
          onTapAppSettings(context);
        }),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 32.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSettingW,
                height: 29.v,
                width: 25.h)));
  }

  /// Section Widget
  Widget _buildAboutUs(BuildContext context) {
    return CustomElevatedButton(
        height: 50.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_about_us".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 57.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgAboutUs,
                height: 30.h,
                width: 35.h)));
  }

  /// Section Widget
  Widget _buildContactUs(BuildContext context) {
    return CustomElevatedButton(
        height: 50.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_contact_us".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 42.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgInfo, height: 35.h, width: 35.h)));
  }

  /// Section Widget
  Widget _buildLogOut(BuildContext context) {
    return CustomElevatedButton(
        height: 50.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_log_out".tr,
        onPressed: () {
          onTapLogOut(context);
        },
        margin: EdgeInsets.only(left: 1.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 60.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgLogout,
                height: 22.v,
                width: 19.h)));
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return CustomElevatedButton(
        height: 32.v,
        width: 153.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(left: 4.v, top: 5.v, bottom: 3.v),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 24.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSearchGray50,
                height: 26.v,
                width: 29.v)),
        buttonTextStyle: theme.textTheme.titleSmall!);
  }

  /// Section Widget
  Widget _buildTwentyThree(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 18.h, right: 18.h, bottom: 12.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 39.adaptSize,
              width: 39.adaptSize,
              padding: EdgeInsets.all(6.h),
              onTap: () {
                onTapBtnHome(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgHome)),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnUser(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgUser))),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnInbox(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgDevices))),
          Spacer(),
          _buildSettings(context)
        ]));
  }

  onTapTwentyEight(BuildContext context) {
    // TODO: implement Actions
  }

  onTapAppSettings(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.appSettigsScreen);
  }

  onTapLogOut(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
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

  onTapBtnInbox(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.deviceScreen,
    );
  }

  onTapBtnprofile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }
}
