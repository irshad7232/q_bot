import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_bot/app/modules/bot/controllers/bot_controller.dart';

class CappBar extends StatelessWidget implements PreferredSizeWidget {
  CappBar({this.typing = false});
  bool? typing;
  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    final _height = Get.height;
    return GetX<BotController>(
      builder: (ctrl) => SizedBox(
        child: SafeArea(
          child: Container(
            width: _width,
            height: _height * 0.085,
            color: Color(0xff121F33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: _width * 0.04),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: _width * 0.02),
                    CircleAvatar(
                      child: SvgPicture.asset('assets/svg/bot.svg'),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: _width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: _width * 0.5,
                          child: Text(
                            'Bot',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: _width * 0.5,
                          child: Text(
                            ctrl.typing.value ? 'Typing...' : 'online',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [Text('data')],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.085);
}
