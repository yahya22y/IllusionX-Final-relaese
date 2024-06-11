import 'package:flutter/material.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 69.v),
              CustomImageView(
                imagePath: ImageConstant.imgVecteezyCuteR,
                height: 234.v,
                width: 230.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 44.h),
              ),
              SizedBox(height: 42.v),
              // SizedBox(
              //   height: 20.v,
              //   child: AnimatedSmoothIndicator(
              //     activeIndex: 0,
              //     count: 2,
              //     effect: ScrollingDotsEffect(
              //       activeDotColor: Color(0X1212121D),
              //       dotHeight: 20.v,
              //     ),
              //   ),
              // ),
              
              CustomImageView(
                imagePath: ImageConstant.imgUpload,
                width: 64.h,
                height: 20.v,
              ),
              SizedBox(height: 24.v),
              Text(
                "msg_welcome_to_the_world".tr,
                style: CustomTextStyles.titlelargeFuturaHvBTWhiteA700,
              ),
              SizedBox(height: 16.v),
              Container(
                width: 257.h,
                margin: EdgeInsets.only(
                  left: 50.h,
                  right: 34.h,
                ),
                child: Text(
                  "msg_i_m_your_personal".tr,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeSecondaryContainer,
                ),
              ),
              SizedBox(height: 83.v),
              CustomElevatedButton(
                height: 50.h,
                width: 219.h,
                decoration: AppDecoration.outlineSecondaryContainer1
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
                onPressed: () {
                  ontapbtnnext(context);
                },
                text: "lbl_next".tr,
              )
            ],
          ),
        ),
      ),
    );
  }

  ontapbtnnext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingSecondScreen,
    );
  }
}
