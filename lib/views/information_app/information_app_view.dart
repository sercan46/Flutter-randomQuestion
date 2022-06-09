import 'package:flutter/material.dart';
import 'package:random_question/core/extension/string_extension.dart';

import '../../core/init/lang/locale_keys.g.dart';
import '../../products/widgets/app_bar/custom_appbar.dart';
import '../../products/widgets/text/custom_text.dart';

class InformationAppView extends StatelessWidget {
  const InformationAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.settings_contact.locale,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          elevation: 8,
          shadowColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Center(
                      child: Image.asset(
                    'assets/icon/icon.png',
                    width: 200,
                  )),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: CustomText(
                      text: LocaleKeys.settings_contact.locale,
                      textStyle:
                          TextStyle(fontSize: 20, color: Colors.purple[700]),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: CustomText(
                  text: LocaleKeys.information_information_detail.locale,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
