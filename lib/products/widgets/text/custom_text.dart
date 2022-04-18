import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends AutoSizeText {
  const CustomText({required String text, Key? key, TextStyle? textStyle})
      : super(text, key: key, style: textStyle);
}
