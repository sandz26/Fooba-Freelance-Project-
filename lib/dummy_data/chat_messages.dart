import "package:checkout/models/chat_message.dart";

List<ChatMessage> messages = [
  ChatMessage(
      name: "John",
      surname: "Doe",
      isOnline: true,
      time: "10:30 AM",
      message: "Hey, how’s my order?",
      isMe: true),
  ChatMessage(
      name: "Support Agent",
      surname: "",
      isOnline: true,
      time: "10:32 AM",
      message: "Hi John! Your order is on the way.",
      isMe: false),
  ChatMessage(
      name: "John",
      surname: "Doe",
      isOnline: true,
      time: "10:34 AM",
      message: "Great, thanks!",
      isMe: true),
];
