import 'dart:async';

import 'dart:core';

import 'package:adlicity/core/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String message, String userId) async {
    await _firestore.collection('messages').add({
      'message': message,
      'userId': userId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Message>> getMessages() {
    return _firestore.collection('messages').orderBy('timestamp', descending: true).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Message.fromSnapshot(doc)).toList(),
    );
  }
}


