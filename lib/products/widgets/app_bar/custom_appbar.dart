import 'package:flutter/material.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, String? title, List<Widget>? actions, TabBar? tabBar})
      : super(
            key: key,
            centerTitle: true,
            title: CustomText(text: title ?? ""),
            actions: actions,
            bottom: tabBar);
}
