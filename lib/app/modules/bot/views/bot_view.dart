import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:q_bot/app/modules/bot/models/bot_models.dart';
import 'package:q_bot/app/modules/bot/widgets/message.dart';
import 'package:q_bot/app/widgets/c_app_bar.dart';
import 'package:q_bot/utils/scroll_conf.dart';

import '../controllers/bot_controller.dart';

class BotView extends GetView<BotController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xff030C1A),
          appBar: CappBar(
            typing: controller.typing.value,
          ),
          body: _buildBotBody(controller)),
    );
  }
}

Widget _buildBotBody(BotController controller) {
  final _width = Get.width;
  final _height = Get.height;
  return Container(
    width: _width * 1,
    height: _height * 1,
    child: Stack(
      children: [
        ListView(
          children: [
            Container(
              width: _width * 1,
              height: _height * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/bg2.jpg'),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehaviour(),
                child: ListView.builder(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Message(chat: controller.chatList[index]);
                  },
                  itemCount: controller.chatList.length,
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Color(0xff121F33),
            //       ),
            //       child: Center(
            //           child: SpinKitThreeBounce(
            //         color: Colors.white,
            //         size: 30.0,
            //       )),
            //     ),
            //   ],
            // ),
            Visibility(
              visible: controller.chatBoxVisibility.value,
              child: _buildBuildTypeBox(controller),
            ),
            Visibility(
              visible: controller.optionWidgetVisibility.value,
              child: Wrap(
                children: [
                  ...controller.optionsList.asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: GestureDetector(
                            onTap: () => controller.checkAnswer(e.value),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.04),
                                child: Text(
                                  e.value,
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
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget _buildBuildTypeBox(BotController controller) {
  final _width = Get.width;
  final _height = Get.height;
  final _nameController = TextEditingController();
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: _width * 0.01,
      ),
      Expanded(
        child: Container(
          height: _height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xff121F33),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.04),
            child: TextField(
              controller: _nameController,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type here...',
                contentPadding: EdgeInsets.only(top: _width * 0.02),
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.1), fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: _width * 0.02,
      ),
      GestureDetector(
        onTap: () => controller.getUserName(_nameController.text),
        child: CircleAvatar(
          radius: 23,
          child: Icon(Icons.send),
        ),
      ),
      SizedBox(
        width: _width * 0.01,
      ),
    ],
  );
}
