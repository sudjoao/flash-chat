import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({Key key, this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
          );
        }

        var messages = snapshot.data.docs.reversed;
        List<MessageBubble> messagesWidget = [];
        for (var message in messages) {
          String messageText = message['text'];
          String messageSender = message['sender'];
          bool isOtherUser = user.email != messageSender;
          MessageBubble messageWidget = MessageBubble(
            sender: messageSender,
            message: messageText,
            isOtherUser: isOtherUser,
          );
          messagesWidget.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messagesWidget,
          ),
        );
      },
    );
  }
}
