import 'dart:async';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_bot/app/data/data.dart';
import 'package:q_bot/app/modules/bot/models/bot_models.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class BotController extends GetxController with WidgetsBindingObserver {
  ScrollController scrollController = ScrollController();

  final _questionIndex = 0;

  var _score = 0;

  final _chatDelay = Duration(milliseconds: 1000);

  var typing = false.obs;
  final chatBoxVisibility = true.obs;
  final optionWidgetVisibility = false.obs;

  final _chatList = [].obs;
  final _optionsList = [].obs;

  final candidateName = ''.obs;

  var random = Random();

  var _correctMessages = [
    'Correct answer',
    'Doing well',
    'Congragulations',
    'hoo good',
    'Oh my god you are good',
    'oh my god its also correct',
    'very good',
    'wonderful',
    'awsome',
    'dedicated',
  ];

  List<String> get optionsList {
    return [..._optionsList];
  }

  List<Chat> get chatList {
    return [..._chatList];
  }

  Future<void> addBotMessage(String message) async {
    typing.value = true;
    Timer(_chatDelay, () {
      _chatList.add(
        Chat(
          id: 0,
          message: message,
          dateTime: DateTime.now(),
          chatType: ChatType.bot,
        ),
      );
      FlutterRingtonePlayer.play(fromAsset: "assets/sound/incoming.mp3");
      scrollController.animateTo(_chatList.length * 400,
          duration: _chatDelay, curve: Curves.ease);
      Future.delayed(Duration(seconds: 2))
          .then((value) => typing.value = false);
    });
  }

  Future<void> addSysMessage(String message) async {
    typing.value = true;
    Timer(_chatDelay, () {
      _chatList.add(
        Chat(
          id: 3,
          message: message,
          dateTime: DateTime.now(),
          chatType: ChatType.sys,
        ),
      );
      scrollController.animateTo(_chatList.length * 400,
          duration: _chatDelay, curve: Curves.ease);
    });
  }

  Future<void> addUserMessage(String message) async {
    Timer(Duration.zero, () {
      _chatList.add(
        Chat(
          id: 0,
          message: message,
          dateTime: DateTime.now(),
          chatType: ChatType.user,
        ),
      );
      scrollController.animateTo(_chatList.length * 400,
          duration: _chatDelay, curve: Curves.ease);
      Future.delayed(Duration(microseconds: 500))
          .then((value) => typing.value = true);
    });
    FlutterRingtonePlayer.play(fromAsset: "assets/sound/send_message.mp3");
  }

  Future<void> startQuiz() async {
    _optionsList.clear();
    if (Data.generalKnowledge.isNotEmpty) {
      Data.generalKnowledge.shuffle();

      Future.delayed(_chatDelay + Duration(seconds: 1)).then((value) =>
          addBotMessage(Data.generalKnowledge[0]['question'] as String));
      Future.delayed(_chatDelay + Duration(seconds: 2)).then((value) =>
          _optionsList
              .addAll(Data.generalKnowledge[0]['options'] as List<String>));
      Future.delayed(_chatDelay).then((_) {
        optionWidgetVisibility.value = true;
      });
    } else {
      addSysMessage('$candidateName Well played! Your score is $_score');
    }
  }

  Future<void> checkAnswer(String ans) async {
    await addUserMessage(ans);
    if (Data.generalKnowledge[0]['answer'] == ans) {
      _score = _score + 10;
      addBotMessage(_correctMessages[random.nextInt(7)]);
      Data.generalKnowledge.removeAt(0);
      startQuiz();
    } else {
      addBotMessage('Oops! the answer was incorrect.');
      addBotMessage(
          'The correct answer is ${Data.generalKnowledge[0]['answer']}');
      Data.generalKnowledge.removeAt(0);
      startQuiz();
    }
  }

  Future<void> getUserName(String name) async {
    candidateName.value = name;
    await addUserMessage(name).then((_) {
      addBotMessage(
        'Okay $name, Welcome to the world of knowledge. You can practice amazing quiz chats here.',
      );
    }).then(
      (_) {
        Future.delayed(Duration(seconds: 1)).then((_) {
          addBotMessage('So take your first question').then((_) {
            typing.value = false;
            chatBoxVisibility.value = false;

            startQuiz();
          });
        });
      },
    );
  }

  void beginsChat() async {
    await addBotMessage('Hello').then(
      (_) => addBotMessage('Your name please'),
    );
  }

////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////

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
    beginsChat();
    // if (humanTalk.value) {
    //   Timer(Duration(milliseconds: 500), () => startChat());
    // }
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
