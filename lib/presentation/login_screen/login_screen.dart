import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:IllusionX/core/app_export.dart';
import 'package:IllusionX/widgets/custom_text_form_field.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:IllusionX/core/utils/validation_functions.dart';
import 'notifier/login_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _clearFocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _login(BuildContext context) async {
    _clearFocus(context);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 350,
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
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      var request = http.MultipartRequest(
          'POST',
          //Uri.parse('http://3.255.227.84:8000/users/login/'), // with deployment
          Uri.parse(
              'http://10.0.2.2:8000/users/login')); // with internal server

      request.fields['username'] = email;
      request.fields['password'] = password;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          String accessToken = jsonResponse['access_token'];
          NavigatorService.pushNamed(AppRoutes.homeScreen);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login Successful'),
          ));
        } else if (response.statusCode == 422) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          _showErrorDialog(context, 'Login failed: ${responseBody['detail']}');
        } else {
          _showErrorDialog(context, 'Incorrect email or password');
        }
      } catch (e) {
        print('An error occurred during login: $e');
        _showErrorDialog(context, 'An error occurred during login');
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 300.0, // Set the desired width
            height: 159.0, // Set the desired height
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Login failed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: message == 'Incorrect email or password'
                          ? 18.0
                          : 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 45.v),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgX1,
                        height: 97.v,
                      ),
                      SizedBox(height: 17.v),
                      Text("lbl_login".tr,
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 39.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Text("lbl_enter_email".tr,
                              style: theme.textTheme.bodyLarge),
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                          controller: _emailController,
                          hintText: "lbl_your_email".tr,
                          textInputType: TextInputType.emailAddress,
                          autofocus: false,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineBlack,
                        );
                      }),
                      SizedBox(height: 34.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Text("lbl_enter_password".tr,
                              style: theme.textTheme.bodyLarge),
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Consumer(builder: (context, ref, _) {
                        return CustomTextFormField(
                          controller: _passwordController,
                          hintText: "msg_your_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          autofocus: false,
                          suffix: InkWell(
                            onTap: () {
                              _togglePasswordVisibility;
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgEye,
                                height: 21.v,
                              ),
                            ),
                          ),
                          suffixConstraints: BoxConstraints(maxHeight: 45.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "please enter valid password";
                            }
                            return null;
                          },
                          obscureText: ref.watch(loginNotifier).isShowPassword,
                          contentPadding: EdgeInsets.only(
                              left: 13.h, top: 14.v, bottom: 14.v),
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineBlack,
                        );
                      }),
                      SizedBox(height: 6.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            onTapBtnforget(context);
                          },
                          child: Text(
                            "msg_forget_password".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.v),
                      CustomElevatedButton(
                          decoration: AppDecoration.outlineSecondaryContainer1
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder11),
                          onPressed: (() {
                            _login(context);
                          }),
                          height: 50.h,
                          width: 219.h,
                          text: "lbl_login".tr),
                      SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                          decoration: AppDecoration.outlineSecondaryContainer1
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder11),
                          onPressed: (() {
                            ontapBtnchat(context);
                          }),
                          height: 50.h,
                          width: 180.h,
                          text: "Chat Without Sign Up".tr),
                      SizedBox(height: 60.v),
                      GestureDetector(
                        onTap: () {
                          onTapTxtDonthaveanaccount(context);
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "msg_don_t_have_an_account2".tr,
                              style:
                                  CustomTextStyles.bodyLargeFuturaHvBTff4d4de9,
                            ),
                            TextSpan(text: "  ".tr),
                            TextSpan(
                              text: "lbl_sign_up".tr,
                              style: CustomTextStyles
                                  .bodyLargeFuturaHvBTff000000
                                  .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ]),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }

  onTapBtnforget(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgetScreen,
    );
  }

  ontapBtnchat(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.chatbotScreen);
  }
}
