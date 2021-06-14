import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({Key key, this.sender, this.message, this.isOtherUser})
      : super(key: key);
  final String sender;
  final String message;
  final bool isOtherUser;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry actualUserBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
    );
    BorderRadiusGeometry otherUserBorderRadius = BorderRadius.only(
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    );
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isOtherUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Material(
            color: isOtherUser ? Colors.white : Colors.lightBlueAccent,
            elevation: 5,
            borderRadius:
                isOtherUser ? otherUserBorderRadius : actualUserBorderRadius,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
              child: Text(
                '$message',
                style: TextStyle(
                  color: isOtherUser ? Colors.black54 : Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
