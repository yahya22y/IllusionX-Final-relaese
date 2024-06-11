import 'dart:async';
import 'package:IllusionX/presentation/chatbot_screen/chat_msg.dart';
import 'package:IllusionX/presentation/chatbot_screen/chat_reply.dart';
import 'package:IllusionX/widgets/app_bar/custom_app_bar.dart';
import 'package:IllusionX/widgets/app_bar/appbar_leading_image.dart';
import 'package:IllusionX/widgets/app_bar/appbar_trailing_image.dart';
import 'package:IllusionX/widgets/custom_icon_button.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotTwoScreen extends ConsumerStatefulWidget {
  const ChatbotTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  ChatbotTwoScreenState createState() => ChatbotTwoScreenState();
}

class ChatMessage {
  final String message;
  final bool isUser;

  ChatMessage({required this.message, required this.isUser});
}

class ChatbotTwoScreenState extends ConsumerState<ChatbotTwoScreen> {
  bool sendButton = false;
  var _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  var message = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    message = _controller.text;
    if (message.trim().isEmpty) {
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

    _controller.clear();

    final apiUrl = 'http://10.0.2.2:8000/chatapi/chat'; // with internal server

    FocusScope.of(context).unfocus(); //for keyboard

    try {
      final response = await http
          .post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'prompt': message,
          'api': 'AIzaSyBz1bvUjzOPTNsNuho8Kp6blRn6ZXO7XgA',
        }),
        // Handling timeouts
        // Increase timeout duration
      )
          .timeout(Duration(seconds: 30), onTimeout: () {
        throw TimeoutException('Connection timed out');
      });

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);

        if (responseBody.containsKey('result')) {
          final reply = responseBody['result'];
          _addMessage(message, true);
          _addMessage(reply, false);
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        } else {
          throw FormatException(
              'Invalid API response format: reply field not found');
        }
      } else {
        throw Exception('Failed to send message to API');
      }
    } catch (e) {
      print('Error: $e');
      // Handle errors, including timeouts
      // You can show a snackbar or dialog to notify the user about the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.v),
          child: Column(
            children: [
              // Spacer(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        ListView(
                          controller: _scrollController,
                          shrinkWrap: true,
                          children: _buildChatMessages(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: _controller,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                sendButton = true;
                              });
                            } else {
                              setState(() {
                                sendButton = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type something...",
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(169, 169, 172, 1),
                              fontSize: 15.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                sendButton ? Icons.send : Icons.mic,
                                color: Color.fromRGBO(77, 77, 233, 1),
                              ),
                              onPressed: () {
                                if (sendButton) {
                                  _sendMessage();
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                  setState(() {
                                    sendButton = false;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildSixtyNine(context),
      ),
    );
  }

  List<ChatMessage> _chatMessages = [];
  List<Widget> _buildChatMessages() {
    return _chatMessages.map((message) {
      return message.isUser
          ? ChatMsg(message: message.message)
          : ReplyCard(message: message.message);
    }).toList();
  }

  void _addMessage(String message, bool isUser) {
    setState(() {
      _chatMessages.add(ChatMessage(message: message, isUser: isUser));
    });
  }
}

/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 45.h,
    leading: AppbarLeadingImage(
      imagePath: ImageConstant.imgVuesaxLinearArrowLeft,
      onTap: () {
        onTapBtnHome(context);
      },
      margin: EdgeInsets.only(
        left: 21.h,
        top: 16.v,
        bottom: 16.v,
      ),
    ),
    actions: [
      AppbarTrailingImage(
        imagePath: ImageConstant.imgVuesaxLinearMessageText,
        onTap: () {
          onTapBtnchatlist(context);
        },
        margin: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 14.v,
        ),
      ),
    ],
  );
}

/// Section Widget
Widget _buildSixtyNine(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 18.h,
      right: 21.h,
      bottom: 12.v,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 39.adaptSize,
          width: 39.adaptSize,
          padding: EdgeInsets.all(6.h),
          onTap: () {
            onTapBtnHome(context);
          },
          child: CustomImageView(
            imagePath: ImageConstant.imgHome,
          ),
        ),
        CustomElevatedButton(
          decoration: AppDecoration.outlineSecondaryContainer1
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
          width: 153.h,
          text: "lbl_chatbot".tr,
          margin: EdgeInsets.only(
            left: 24.h,
            top: 5.v,
            bottom: 3.v,
          ),
          leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgThumbsup,
              height: 20.v,
            ),
          ),
        ),
        Spacer(),
        CustomIconButton(
          height: 39.adaptSize,
          width: 39.adaptSize,
          padding: EdgeInsets.all(6.h),
          onTap: () {
            onTapBtnDevices(context);
          },
          child: CustomImageView(
            imagePath: ImageConstant.imgDevices,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: CustomIconButton(
            height: 39.adaptSize,
            width: 39.adaptSize,
            padding: EdgeInsets.all(4.h),
            onTap: () {
              onTapBtnSearch(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgSearch,
            ),
          ),
        ),
      ],
    ),
  );
}

onTapBtnHome(BuildContext context) {
  NavigatorService.pushNamed(
    AppRoutes.homeScreen,
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

onTapBtnchatlist(BuildContext context) {
  NavigatorService.pushNamed(
    AppRoutes.chatbotlistScreen,
  );
}
