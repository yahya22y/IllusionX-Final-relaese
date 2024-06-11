import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/app_export.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashOneScreen extends ConsumerStatefulWidget {
  const SplashOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SplashOneScreenState createState() => SplashOneScreenState();
}

class SplashOneScreenState extends ConsumerState<SplashOneScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2), // Change the duration as per your requirement
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          height: 800.v,
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 31.h,
            top: 324.v,
            right: 31.h,
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgXWhite1,
                height: 103.v,
                width: 147.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 9.h),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 150.h,
                    top: 14.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "lbl_illusionx".tr,
                        style: CustomTextStyles.headlineLargeWhiteA70032,
                      ),
                      SizedBox(height: 13.v),
                      Text(
                        "msg_a_personal_companion".tr,
                        style: CustomTextStyles.bodyLargeFuturaHvBTWhiteA700,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
