import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({super.key,required this.message,required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isCurrentUser ? Color.fromRGBO(220, 248, 198, 1.0) : Colors.white,
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black
        ),
      ),
    );
  }
}
