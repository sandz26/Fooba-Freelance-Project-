// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


class ChatMessage {
  final String name;
  final String surname;
  final bool isOnline;
  final String time;
  final String message;
  final bool isMe;

  ChatMessage({
    required this.name,
    required this.surname,
    required this.isOnline,
    required this.time,
    required this.message,
    required this.isMe,
  });
}