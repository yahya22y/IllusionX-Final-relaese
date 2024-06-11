import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:IllusionX/presentation/chatbot_draweritem/models/chatbot_model.dart';
part 'chatbot_state.dart';

final chatbotNotifier = StateNotifierProvider<ChatbotNotifier, ChatbotState>(
  (ref) => ChatbotNotifier(ChatbotState(
    botCounterController: TextEditingController(),
    botCounter1Controller: TextEditingController(),
    chatbotModelObj: ChatbotModel(),
  )),
);

/// A notifier that manages the state of a Chatbot according to the event that is dispatched to it.
class ChatbotNotifier extends StateNotifier<ChatbotState> {
  ChatbotNotifier(ChatbotState state) : super(state) {}
}
