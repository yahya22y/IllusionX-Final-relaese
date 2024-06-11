import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class OnboardingSecondScreen extends ConsumerStatefulWidget {
  const OnboardingSecondScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingSecondScreenState createState() => OnboardingSecondScreenState();
}

class OnboardingSecondScreenState
    extends ConsumerState<OnboardingSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 27.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 69.v),
              CustomImageView(
                imagePath: ImageConstant.imgVecteezyCuteR234x329,
                height: 234.v,
                width: 329.h,
              ),
              SizedBox(height: 44.v),
              CustomImageView(
                imagePath: ImageConstant.imgUpload,
                height: 20.v,
                width: 64.h,
              ),
              SizedBox(height: 21.v),
              Text(
                "msg_explore_the_possibilities".tr,
                style: CustomTextStyles.titlelargeFuturaHvBTWhiteA700,
              ),
              SizedBox(height: 17.v),
              Container(
                width: 284.h,
                margin: EdgeInsets.only(
                  left: 30.h,
                  right: 21.h,
                ),
                child: Text(
                  "msg_let_s_explore_the".tr,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeSecondaryContainer,
                ),
              ),
              SizedBox(height: 64.v),
              CustomElevatedButton(
                height: 50.h,
                width: 219.h,
                decoration: AppDecoration.outlineSecondaryContainer1
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
                onPressed: () {
                  ontapbtngetstarted(context);
                },
                text: "lbl_get_started".tr,
                
              )
            ],
          ),
        ),
      ),
    );
  }

  ontapbtngetstarted(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
