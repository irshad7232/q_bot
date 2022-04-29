import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_bot/app/modules/home/widgets/titles.dart';
import 'package:q_bot/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff011638),
      appBar: _buidAppBar(),
      body: _buildBody(),
    );
  }
}

PreferredSizeWidget _buidAppBar() {
  return AppBar(
    backgroundColor: Color(0xff187BCD),
    elevation: 0,
  );
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _buildHomeCard(),
        Titles(
          title: 'Top Chats',
        ),
        _buildTopChats(),
        Titles(
          title: 'Top Chats',
        ),
        _buildC1(),
        Titles(
          title: 'Top Chats',
        ),
        _buildC2(),
      ],
    ),
  );
}

Widget _buildHomeCard() {
  final _width = Get.width;
  final _height = Get.height;
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: _width * 1,
          height: _height * 0.3,
          decoration: BoxDecoration(
            // color: Color(0xff121F33),
            color: Color(0xff187BCD),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 5,
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
        ),
      ),
      Positioned(
          child: SvgPicture.asset(
        'assets/svg/ellipse.svg',
        height: _height * 0.2,
      )),
      Positioned(
          bottom: _height * 0.0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/ellipse.svg',
            height: _height * 0.13,
          )),
      // Positioned(
      //     bottom: _height * 0.06,
      //     left: _width * 0.03,
      //     child: Container(
      //       child: SvgPicture.asset(
      //         'assets/svg/login_bg_rect1.svg',
      //         width: _width * 0.1,
      //       ),
      //     )),
      Positioned(
        top: _height * 0.03,
        left: _width * 0.06,
        child: CircleAvatar(
          radius: _width * 0.1,
          child: Image.asset('assets/img/bot.png'),
        ),
      ),
      Positioned(
        top: _height * 0.02,
        left: _width * 0.33,
        child: Text(
          'Hello I\'m Laya',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
      Positioned(
        top: _height * 0.06,
        left: _width * 0.33,
        child: Text(
          'The Knowledge bot',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
      Positioned(
        top: _height * 0.1,
        left: _width * 0.33,
        child: Container(
          width: _width * 0.5,
          height: _height * 0.05,
          decoration: BoxDecoration(
            // color: Color(0xff011638),
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Hey, How can i assist you?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    height: 1.3,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: _height * 0.16,
        right: _width * 0.05,
        child: Container(
          width: _width * 0.5,
          height: _height * 0.05,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 10),
              Text(
                'Hey, How can i assist you?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    height: 1.3,
                    color: Colors.white),
              ),
              SizedBox(width: 10)
            ],
          ),
        ),
      ),
      Positioned(
        top: _height * 0.221,
        left: _width * 0.33,
        child: Container(
          width: _width * 0.4,
          height: _height * 0.05,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(
                'Why not! Join us',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    height: 1.3,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: _height * 0.265,
        left: _width * 0.33,
        child: Container(
            width: _width * 0.4,
            height: _height * 0.05,
            child: Row(
              children: [
                SpinKitThreeBounce(
                  size: 20,
                  color: Colors.white.withOpacity(0.2),
                ),
              ],
            )),
      ),
    ],
  );
}

Widget _buildTopChats() {
  final _height = Get.height;
  final _width = Get.width;
  return SizedBox(
    width: _width,
    height: _height * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.BOT),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: _width * 0.3,
                height: _height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                    gradient: LinearGradient(
                        colors: [Color(0xff890774), Color(0xff9031CA)])),
                child: Stack(
                  children: [SvgPicture.asset('assets/svg/net.svg')],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    ),
  );
}

Widget _buildC1() {
  final _height = Get.height;
  final _width = Get.width;
  return SizedBox(
    width: _width,
    height: _height * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: _width * 0.02, vertical: 2),
          child: Container(
            width: _width * 0.5,
            height: _height * 0.15,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
                borderRadius: BorderRadius.circular(20)),
          ),
        );
      },
      itemCount: 10,
    ),
  );
}

Widget _buildC2() {
  final _height = Get.height;
  final _width = Get.width;
  return SizedBox(
    width: _width,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _width * 0.02, vertical: _width * 0.03),
          child: Container(
            width: _width * 0.5,
            height: _height * 0.3,
            decoration: BoxDecoration(
                color: Color(0xff121F33),
                borderRadius: BorderRadius.circular(20)),
          ),
        );
      },
      itemCount: 10,
    ),
  );
}
