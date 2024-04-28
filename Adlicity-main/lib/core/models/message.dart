import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String message;
  final String userId;
  final Timestamp timestamp;

  Message({required this.message, required this.userId, required this.timestamp});

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    return Message(
      message: snapshot['message'],
      userId: snapshot['userId'],
      timestamp: snapshot['timestamp'],
    );
  }
}
