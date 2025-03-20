import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:checkout/dummy_data/chat_messages.dart';
import 'package:checkout/models/chat_message.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_chatflow/chatflow.dart';
import 'package:flutter_chatflow/event_manager.dart';
import 'package:flutter_chatflow/library.dart';
import 'package:flutter_chatflow/message_gesture_callback_manager.dart';
import 'package:flutter_chatflow/message_interface.dart';
import 'package:flutter_chatflow/models.dart';
import 'package:flutter_chatflow/notifier.dart';
import 'package:flutter_chatflow/utils/type_defs.dart';
import 'package:flutter_chatflow/utils/types.dart';
import 'package:flutter_chatflow/utils/utils.dart';
import 'package:flutter_chatflow/widgets/adapt_container_height_to_child_max_height.dart';
// import 'package:flutter_chatflow/widgets/audio/audio_message.dart';
// import 'package:flutter_chatflow/widgets/audio/audio_widget.dart';
import 'package:flutter_chatflow/widgets/chat_avatar.dart';
import 'package:flutter_chatflow/widgets/chat_bubble.dart';
// import 'package:flutter_chatflow/widgets/chat_input.dart';
// import 'package:flutter_chatflow/widgets/computed_widget.dart';
import 'package:flutter_chatflow/widgets/image/grouped_images.dart';
import 'package:flutter_chatflow/widgets/image/image_carousel.dart';
// import 'package:flutter_chatflow/widgets/image/image_message.dart';
import 'package:flutter_chatflow/widgets/image/image_swipe.dart';
import 'package:flutter_chatflow/widgets/image/image_upload_preview_with_text_input.dart';
// import 'package:flutter_chatflow/widgets/image/image_widget.dart';
import 'package:flutter_chatflow/widgets/media_selection_with_text.dart';
import 'package:flutter_chatflow/widgets/replied_message_widget.dart';
import 'package:flutter_chatflow/widgets/sent_at.dart';
import 'package:flutter_chatflow/widgets/video/video_message.dart';
import 'package:flutter_chatflow/widgets/video/video_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _messages = [];

  ChatUser author = ChatUser(userID: '123');

  void _addMessage(Message message) {
    /// Handle sending message to server

    ///Sending to local collection below [OPTIONAL if sent to server and listened correctly]
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(String message, {Message? repliedTo}) {
    int createdAt = DateTime.now().millisecondsSinceEpoch;

    final textMessage = TextMessage(
        author: author,
        createdAt: createdAt,
        text: message,
        status: DeliveryStatus.sending);

    _addMessage(textMessage);
  }

  Future<void> _handleOnAttachmentPressed({Message? repliedTo}) async {
    /// logic for adding image to chat.
    /// You could use a dialog to choose between different media types
    /// And rename the function accordingly
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: ChatFlow(
          messages: _messages,
          chatUser: author,
          onSendPressed: _handleSendPressed,
          onAttachmentPressed: _handleOnAttachmentPressed),
    );
  }
}

// class LiveChatScreen extends StatefulWidget {
//   const LiveChatScreen({super.key});

//   @override
//   State<LiveChatScreen> createState() => _LiveChatScreenState();
// }

// class _LiveChatScreenState extends State<LiveChatScreen> {
//   final TextEditingController _messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         surfaceTintColor: Colors.white,
//         backgroundColor: Colors.white,
//         shadowColor: Colors.grey,
//         elevation: 6,
//         title: const Text(
//           "Live Chat",
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 20,
//                     backgroundColor: Colors.grey,
//                     child: Icon(Icons.person, color: Colors.white),
//                   ),
//                   const SizedBox(width: 10),
//                   Column(
//                     children: [
//                       Text(
//                         messages.firstWhere((msg) => !msg.isMe).name,
//                         style: GoogleFonts.nunito(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Online',
//                         style: GoogleFonts.nunito(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black.withValues(alpha: 0x4D)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final chat = messages[messages.length - 1 - index];
//                   return Align(
//                     alignment: chat.isMe
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       child: Column(
//                         crossAxisAlignment: chat.isMe
//                             ? CrossAxisAlignment.start
//                             : CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             chat.time,
//                             style: GoogleFonts.nunito(
//                                 fontSize: 12, color: Colors.black),
//                           ),
//                           Container(
//                             width: 297,
//                             margin: const EdgeInsets.only(
//                               top: 5,
//                               bottom: 5,
//                             ),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color:
//                                   chat.isMe ? Colors.black : Colors.grey[300],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   chat.isMe ? "You" : chat.name,
//                                   style: GoogleFonts.nunito(
//                                     fontWeight: FontWeight.bold,
//                                     color:
//                                         chat.isMe ? Colors.white : Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   chat.message,
//                                   style: GoogleFonts.nunito(
//                                     color:
//                                         chat.isMe ? Colors.white : Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       decoration: InputDecoration(
//                         hintText: "Type a message...",
//                         filled: true,
//                         fillColor: Colors.grey[200],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 15),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   IconButton(
//                     onPressed: () {
//                       if (_messageController.text.trim().isNotEmpty) {
//                         setState(() {
//                           messages.insert(
//                             0,
//                             ChatMessage(
//                               name: "You",
//                               surname: "",
//                               isOnline: true,
//                               time: "Now",
//                               message: _messageController.text.trim(),
//                               isMe: true,
//                             ),
//                           );
//                           _messageController.clear();
//                         });
//                       }
//                     },
//                     icon: const Icon(Icons.send, color: Colors.black),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
