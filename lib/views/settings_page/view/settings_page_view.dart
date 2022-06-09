import 'package:flutter/material.dart';
import 'package:random_question/core/extension/string_extension.dart';
import 'package:random_question/core/init/lang/locale_keys.g.dart';
import 'package:random_question/products/widgets/app_bar/custom_appbar.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../products/widgets/text/custom_text.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.settings_header.locale,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.SELECT_LANGUAGE);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.language),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: LocaleKeys.settings_change_language.locale,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.FAVORITE_LIST);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: LocaleKeys.settings_show_favorite_list.locale,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.INFORMATION_APP);
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.info,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: LocaleKeys.settings_contact.locale,
                        textStyle: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
