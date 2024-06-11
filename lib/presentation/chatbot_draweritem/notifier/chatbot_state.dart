// ignore_for_file: must_be_immutable

part of 'chatbot_notifier.dart';

/// Represents the state of Chatbot in the application.
class ChatbotState extends Equatable {
  ChatbotState({
    this.botCounterController,
    this.botCounter1Controller,
    this.chatbotModelObj,
  });

  TextEditingController? botCounterController;

  TextEditingController? botCounter1Controller;

  ChatbotModel? chatbotModelObj;

  @override
  List<Object?> get props => [
        botCounterController,
        botCounter1Controller,
        chatbotModelObj,
      ];

  ChatbotState copyWith({
    TextEditingController? botCounterController,
    TextEditingController? botCounter1Controller,
    ChatbotModel? chatbotModelObj,
  }) {
    return ChatbotState(
      botCounterController: botCounterController ?? this.botCounterController,
      botCounter1Controller:
          botCounter1Controller ?? this.botCounter1Controller,
      chatbotModelObj: chatbotModelObj ?? this.chatbotModelObj,
    );
  }
}
