// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:green_chat/core/models/message_model.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/core/other/base_view_modle.dart';
import 'package:green_chat/core/services/chat_service.dart';

class ChatScreenViewModel extends BaseViewModle {
  final ChatService _chatService;
  final UserModel _currentUser;
  final UserModel _reciever;
  StreamSubscription? _streamSubscription;
  ChatScreenViewModel(
    this._chatService,
    this._currentUser,
    this._reciever,
  ) {
    getChatRoom();
    _streamSubscription =
        _chatService.getMessages(chatRoomId).listen((messages) {
      _messages = messages.docs.map((e) => Message.fromMap(e.data())).toList();
      notifyListeners();
    });
  }
  String chatRoomId = "";
  List<Message> _messages = [];
  final _messageController = TextEditingController();

  TextEditingController get controller => _messageController;
  List<Message> get messages => _messages;

  getChatRoom() {
    if (_currentUser.uid.hashCode > _reciever.uid.hashCode) {
      chatRoomId = "${_currentUser.uid}_${_reciever.uid}";
    } else {
      chatRoomId = "${_reciever.uid}_${_currentUser.uid}";
    }
  }

  saveMessage() async {
    final now = DateTime.now();
    try {
      final message = Message(
          id: now.microsecondsSinceEpoch.toString(),
          timeStamp: now,
          senderId: _currentUser.uid,
          receiverId: _reciever.uid,
          content: _messageController.text);
      await _chatService.saveMessage(message.toMap(), chatRoomId);
      _messageController.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
