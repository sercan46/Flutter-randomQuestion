
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/products/widgets/app_bar/custom_appbar.dart';
import 'package:restart_app/restart_app.dart';
import '../../../core/init/lang/language_manager.dart';

class SelectedLanguageView extends StatefulWidget {
  const SelectedLanguageView({Key? key}) : super(key: key);

  @override
  State<SelectedLanguageView> createState() => _SelectedLanguageViewState();
}

class _SelectedLanguageViewState extends State<SelectedLanguageView> {
  @override
  Widget build(BuildContext context) {
    bool? isTurkish =
        context.locale == LanguageManager.instance.trLocale ? true : false;
    bool? isEnglish =
        context.locale == LanguageManager.instance.trLocale ? false : true;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.settings_change_language.locale,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [
              CheckboxListTile(
                title: Text(LocaleKeys.languages_turkish.locale),
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: isTurkish,
                onChanged: (newValue) {
                  setState(
                    () {
                      isTurkish = newValue!;
                      isEnglish = !newValue;
                      context
                          .setLocale(LanguageManager.instance.trLocale)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(LocaleKeys.languages_information.locale),
                          ),
                        );
                        Restart.restartApp();
                      });
                    },
                  );
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const Divider(),
              CheckboxListTile(
                title: Text(LocaleKeys.languages_english.locale),
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: isEnglish,
                onChanged: (newValue) {
                  setState(
                    () {
                      isEnglish = newValue!;
                      isTurkish = !newValue;
                      context
                          .setLocale(LanguageManager.instance.enLocale)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text(LocaleKeys.languages_information.locale),
                          ),
                        );
                        Restart.restartApp();
                      });
                    },
                  );
                },
                controlAffinity: ListTileControlAffinity.leading,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
