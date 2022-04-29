import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_bot/app/data/data.dart';
import 'package:q_bot/app/modules/bot/models/bot_models.dart';

import '../widgets/message.dart';

class BotController extends GetxController with WidgetsBindingObserver {
  ScrollController scrollController = ScrollController();

  final _chatDelay = Duration(milliseconds: 1500);

  final _chatList = [].obs;

  final humanTalk = true.obs;

  var typing = false.obs;

  final chatBoxVisibility = true.obs;

  List<Chat> get chatList {
    return [..._chatList];
  }

  void startChat() async {
    Timer(_chatDelay, () {
      typing.value = true;
      _chatList.add(Chat(
        id: 0,
        message: Data.humanTalk[0],
        dateTime: DateTime.now(),
        chatType: ChatType.bot,
      ));
    });
    Timer(_chatDelay + Duration(seconds: 2), () {
      _chatList.add(Chat(
        id: 0,
        message: Data.humanTalk[1],
        dateTime: DateTime.now(),
        chatType: ChatType.bot,
      ));
    });
    Timer(_chatDelay + Duration(milliseconds: 3000), () {
      typing.value = false;
    });
  }

  void sendName(String name) {
    _chatList.add(
      Chat(
          id: 1,
          message: name,
          dateTime: DateTime.now(),
          chatType: ChatType.user),
    );

    Timer(_chatDelay, () {
      typing.value = true;
      _chatList.add(
        Chat(
          id: 0,
          message: 'Okay $name, Let\'s start this quiz ',
          dateTime: DateTime.now(),
          chatType: ChatType.bot,
        ),
      );
    });
    Timer(_chatDelay + Duration(milliseconds: 500), () {
      typing.value = false;
      chatBoxVisibility.value = false;
    });
  }

  Future<bool> get keyboardHidden async {
    final check =
        () => (WidgetsBinding.instance?.window.viewInsets.bottom ?? 0) <= 0;
    if (!check()) return false;
    return await Future.delayed(Duration(milliseconds: 100), () => check());
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
    if (humanTalk.value) {
      Timer(Duration(milliseconds: 500), () => startChat());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    keyboardHidden.then((value) => value
        ? null
        : scrollController.animateTo(_chatList.length * 400,
            duration: _chatDelay, curve: Curves.ease));
    super.didChangeMetrics();
  }
}
