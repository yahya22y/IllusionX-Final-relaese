// ignore_for_file: must_be_immutable

part of 'chatbot_notifier.dart';

/// Represents the state of Chatbot in the application.
class ChatbotState extends Equatable {
  ChatbotState({
    this.menuController,
    this.chatbotModelObj,
  });

  TextEditingController? menuController;

  ChatbotModel? chatbotModelObj;

  @override
  List<Object?> get props => [
        menuController,
        chatbotModelObj,
      ];

  ChatbotState copyWith({
    TextEditingController? menuController,
    ChatbotModel? chatbotModelObj,
  }) {
    return ChatbotState(
      menuController: menuController ?? this.menuController,
      chatbotModelObj: chatbotModelObj ?? this.chatbotModelObj,
    );
  }
}
