import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_title.dart';
import 'package:IllusionX/widgets/app_bar/appbar_trailing_image.dart';
import 'package:IllusionX/widgets/custom_text_form_field.dart';
import 'package:IllusionX/widgets/custom_drop_down.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'notifier/profile_notifier.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgProfilePicture115x124,
                height: 115.v,
                width: 124.h,
                radius: BorderRadius.circular(
                  57.h,
                ),
              ),
              SizedBox(height: 14.v),
              Text(
                "lbl_peter_parker".tr,
                style: CustomTextStyles.bodyMediumFuturaHvBTPrimary,
              ),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_first_name2".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              _buildFirstName(context),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_last_name2".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              _buildLastName(context),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_email2".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              _buildEmail(context),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_password2".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              _buildPassword(context),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_gender".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              Consumer(
                builder: (context, ref, _) {
                  return CustomDropDown(
                    icon: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 22.h,
                        vertical: 15.v,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgArrowdown,
                        height: 15.v,
                        width: 24.h,
                      ),
                    ),
                    items: ref
                            .watch(profileNotifier)
                            .profileModelObj
                            ?.dropdownItemList ??
                        [],
                  );
                },
              ),
              SizedBox(height: 7.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_date_of_birth".tr,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 3.v),
              _buildDateOfBirth(context),
              SizedBox(height: 39.v),
              _buildFiftyOne(context),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
        onTap: () {
          onTapSave(context);
        },
        margin: EdgeInsets.only(
          left: 21.h,
          top: 15.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_profile".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgEdit,
          margin: EdgeInsets.fromLTRB(20.h, 19.v, 20.h, 20.v),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          controller: ref.watch(profileNotifier).firstNameController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          controller: ref.watch(profileNotifier).lastNameController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          controller: ref.watch(profileNotifier).emailController,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          controller: ref.watch(profileNotifier).passwordController,
          obscureText: true,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return CustomTextFormField(
          controller: ref.watch(profileNotifier).dateOfBirthController,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCancel(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 40.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_cancel".tr,
        margin: EdgeInsets.only(right: 10.h),
        onPressed: () {
          onTapSave(context);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 40.h,
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 10.h),
        onPressed: () {
          onTapSave(context);
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildCancel(context), _buildSave(context)],
    );
  }

  onTapSave(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
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
}
