import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_title.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:IllusionX/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 18.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("msg_let_s_see_how_i".tr,
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 27.v),
                      _buildNinetyFive(context),
                      SizedBox(height: 47.v),
                      _buildEleven(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildFiftyNine(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_hey_peter".tr,
            margin: EdgeInsets.only(
              left: 21.h,
            )));
  }

  /// Section Widget
  Widget _buildNinetyFive(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 17.v),
          decoration: AppDecoration.gradientIndigoAToBlueGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 14.v),
              CustomImageView(
                imagePath: ImageConstant.imgVecteezyCuteR165x145,
                height: 165.v,
                width: 145.h,
              ),
              SizedBox(height: 6.v),
              Text("lbl_tasks".tr, style: theme.textTheme.headlineSmall),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 17.v),
              decoration: AppDecoration.gradientIndigoAToBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 148.h,
                    margin: EdgeInsets.only(right: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgHeartWithPulse,
                          height: 41.v,
                          width: 46.h,
                          margin: EdgeInsets.only(top: 2.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgRightArrow,
                          height: 43.v,
                          width: 38.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Text(
                    "lbl_statistics".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.v),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.v),
              decoration: AppDecoration.gradientIndigoAToBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.v),
                  GestureDetector(
                    child: Container(
                      width: 153.h,
                      margin: EdgeInsets.only(right: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEarthGlobe,
                            height: 43.v,
                            width: 56.h,
                            margin: EdgeInsets.only(top: 1.v),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgRightArrow,
                            height: 43.v,
                            width: 38.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.v),
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "lbl_my_world".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(17.h),
        decoration: AppDecoration.gradientIndigoAToBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder25),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.v),
              Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Text("lbl_recent_chat".tr,
                      style: CustomTextStyles.titleLargeMontserratWhiteA700)),
              SizedBox(height: 11.v),
              Container(
                  margin: EdgeInsets.only(right: 1.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 9.h, vertical: 24.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder35),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5.h, right: 53.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.h, vertical: 8.v),
                            decoration: AppDecoration.outlineSecondaryContainer
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderBL10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1.v),
                                  SizedBox(
                                      width: 212.h,
                                      child: Text("msg_lorem_ipsum_dolor".tr,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodySmallOnPrimary))
                                ])),
                        SizedBox(height: 19.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                width: 243.h,
                                margin: EdgeInsets.only(left: 58.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 8.v),
                                decoration: AppDecoration.fillPrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 1.v),
                                      Container(
                                          width: 212.h,
                                          margin: EdgeInsets.only(left: 9.h),
                                          child: Text(
                                              "msg_lorem_ipsum_dolor".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall))
                                    ]))),
                        SizedBox(height: 5.v)
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildFiftyNine(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 21.h, bottom: 13.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 153.h,
              margin: EdgeInsets.symmetric(vertical: 10.v),
              decoration: AppDecoration.outlineSecondaryContainer1
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                        height: 32.v,
                        width: 153.h,
                        text: "lbl_home".tr,
                        margin: EdgeInsets.only(bottom: 2.v),
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 15.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgHomeWhite,
                                height: 15.v,
                                width: 24.v)),
                        buttonTextStyle: theme.textTheme.titleSmall!)
                  ])),
          Spacer(),
          CustomIconButton(
              height: 39.adaptSize,
              width: 39.adaptSize,
              padding: EdgeInsets.all(6.h),
              onTap: () {
                onTapBtnUser(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgUser)),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(6.h),
                  onTap: () {
                    onTapBtnDevices(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgDevices))),
          Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: CustomIconButton(
                  height: 39.adaptSize,
                  width: 39.adaptSize,
                  padding: EdgeInsets.all(4.h),
                  onTap: () {
                    onTapBtnSearch(context);
                  },
                  child: CustomImageView(imagePath: ImageConstant.imgSearch)))
        ]));
  }

  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatbotScreen,
    );
  }

  onTapBtnDevices(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.deviceScreen,
    );
  }

  onTapBtnSearch(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }
}
