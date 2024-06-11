import 'package:IllusionX/widgets/custom_text_form_field.dart';
import 'package:IllusionX/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:IllusionX/core/app_export.dart';
import 'notifier/chatbot_notifier.dart';

// ignore_for_file: must_be_immutable
class ChatbotDraweritem extends ConsumerStatefulWidget {
  const ChatbotDraweritem({Key? key})
      : super(
          key: key,
        );

  @override
  ChatbotDraweritemState createState() => ChatbotDraweritemState();
}

class ChatbotDraweritemState extends ConsumerState<ChatbotDraweritem> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 69.h),
                child: Text(
                  "lbl_bots_list".tr,
                  style: CustomTextStyles.titlelargeFuturaHvBT,
                ),
              ),
              SizedBox(height: 68.v),
              Consumer(
                builder: (context, ref, _) {
                  return CustomTextFormField(
                    width: 200.h,
                    controller: ref.watch(chatbotNotifier).botCounterController,
                    hintText: "lbl_bot_1".tr,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 10.v,
                    ),
                  );
                },
              ),
              SizedBox(height: 17.v),
              Consumer(
                builder: (context, ref, _) {
                  return CustomTextFormField(
                    width: 200.h,
                    controller:
                        ref.watch(chatbotNotifier).botCounter1Controller,
                    hintText: "lbl_bot_2".tr,
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 7.v,
                    ),
                  );
                },
              ),
              SizedBox(height: 26.v),
              Container(
                width: 200.h,
                margin: EdgeInsets.only(right: 3.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.outlineSecondaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Text(
                  "lbl_bot_3".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 401.v),
              CustomElevatedButton(
                width: 186.h,
                text: "lbl_history".tr,
                onPressed: (() {
                  onTapBtnUser(context);
                }),
                margin: EdgeInsets.only(right: 7.h),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatbotScreen,
    );
  }
}
