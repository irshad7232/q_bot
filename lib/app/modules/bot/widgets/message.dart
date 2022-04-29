import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:q_bot/app/modules/bot/models/bot_models.dart';

class Message extends StatelessWidget {
  Message({Key? key, required this.chat}) : super(key: key);

  final _width = Get.width;

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Row(
        mainAxisAlignment: chat.chatType == ChatType.bot
            ? MainAxisAlignment.start
            : chat.chatType == ChatType.user
                ? MainAxisAlignment.end
                : MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: chat.chatType == ChatType.user ||
                      chat.chatType == ChatType.bot
                  ? _width * 0.9
                  : _width * 1,
            ),
            child: Container(
                child: chat.chatType == ChatType.bot
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset('assets/svg/bot.svg'),
                            ),
                            SizedBox(
                              width: _width * 0.01,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: _width * 0.7),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff121F33),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * 0.04,
                                      vertical: _width * 0.02),
                                  child: Text(
                                    chat.message,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2,
                                        height: 1.3,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : chat.chatType == ChatType.user
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ConstrainedBox(
                                  constraints:
                                      BoxConstraints(maxWidth: _width * 0.7),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff1D74F5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.02),
                                      child: Text(
                                        chat.message,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.2,
                                            height: 1.3,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: _width * 0.01,
                                ),
                                CircleAvatar(
                                  child:
                                      SvgPicture.asset('assets/svg/user.svg'),
                                  radius: 12,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConstrainedBox(
                                  constraints:
                                      BoxConstraints(maxWidth: _width * 0.7),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.02),
                                      child: Text(
                                        chat.message,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.2,
                                            height: 1.3,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
          ),
        ],
      ),
    );
  }
}
