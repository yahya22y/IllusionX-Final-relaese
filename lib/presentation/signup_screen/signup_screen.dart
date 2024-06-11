import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_title.dart';
import 'package:IllusionX/core/utils/validation_functions.dart';
import 'package:IllusionX/widgets/custom_text_form_field.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'notifier/signup_notifier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _clearFocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _signup(BuildContext context, String authorizationKey) async {
    _clearFocus(context);
    if (_formKey.currentState!.validate()) {
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Passwords do not match'),
        ));
        return;
      }
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: 330,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No Internet Connection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please check your internet connection.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        return;
      }

      Map<String, dynamic> requestBody = {
        'user_profile': {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        },
      };

      try {
        final response = await http.post(
          //Uri.parse('http://3.255.227.84:8000/users/signup/'),  // with deployment
          Uri.parse(
              'http://10.0.2.2:8000/users/signup'), // with internal server
          body: jsonEncode(requestBody),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': authorizationKey,
          },
        );

        if (response.statusCode == 201) {
          NavigatorService.pushNamed(AppRoutes.loginScreen);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Signup Successfully'),
          ));
        } else if (response.statusCode == 422) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Signup failed: ${responseBody['detail']}'),
          ));
        }
      } catch (e) {
        print('Exception during signup: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('An error occurred during signup'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.h,
                  vertical: 48.v,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: Text(
                          "msg_enter_first_name".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    _buildFirstName(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_last_name".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.v),
                    _buildLastName(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_email".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    _buildEmail(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          "lbl_enter_password".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.v),
                    _buildPassword(context),
                    SizedBox(height: 33.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "msg_confirm_password".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 50.v),
                    _buildSignUp(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
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
          ontapbtnarrow(context);
        },
        margin: EdgeInsets.only(
          left: 21.h,
          top: 14.v,
          bottom: 17.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_sign_up".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 5.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: _firstNameController,
            hintText: "lbl_first_name".tr,
            hintStyle: CustomTextStyles.bodyMediumMontserrat,
            autofocus: false,
            validator: (value) {
              if (!isText(value)) {
                return "please enter valid text";
              }
              return null;
            },
            borderDecoration: TextFormFieldStyleHelper.fillOnPrimary,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 4.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: _lastNameController,
            hintText: "lbl_last_name".tr,
            autofocus: false,
            validator: (value) {
              if (!isText(value)) {
                return "please enter valid text";
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: _emailController,
            hintText: "lbl_email".tr,
            textInputType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "please enter valid email";
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: _passwordController,
            hintText: "lbl_password".tr,
            textInputType: TextInputType.visiblePassword,
            autofocus: false,
            suffix: InkWell(
              onTap: () {
                ref.read(signupNotifier.notifier).changePasswordVisibility();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 11.v, 10.h, 11.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEye,
                  height: 20.v,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 45.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "please enter valid password";
              }
              return null;
            },
            obscureText: ref.watch(signupNotifier).isShowPassword,
            contentPadding: EdgeInsets.only(
              left: 16.h,
              top: 14.v,
              bottom: 14.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 2.h,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          return CustomTextFormField(
            controller: _confirmPasswordController,
            hintText: "msg_confirm_password2".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            autofocus: false,
            suffix: InkWell(
              onTap: () {
                ref.read(signupNotifier.notifier).changePasswordVisibility1();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 11.v, 10.h, 11.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEye,
                  height: 20.v,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 45.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "please enter valid password";
              }
              return null;
            },
            obscureText: ref.watch(signupNotifier).isShowPassword1,
            contentPadding: EdgeInsets.only(
              left: 15.h,
              top: 14.v,
              bottom: 14.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      height: 50.h,
      width: 219.h,
      text: "lbl_sign_up".tr,
      buttonStyle: CustomButtonStyles.outlineBlackTL15,
      decoration: AppDecoration.outlineSecondaryContainer1
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
      onPressed: () {
        //onTapBtnHome(context);
        String authorizationKey =
            'Your dynamic authorization key'; // Fetch the authorization key from wherever it's stored
        _signup(context, authorizationKey);
      },
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  ontapbtnarrow(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
