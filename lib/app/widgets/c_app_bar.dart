import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CappBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final _width = Get.width;
    final _height = Get.height;
    return Container(
      width: _width,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
