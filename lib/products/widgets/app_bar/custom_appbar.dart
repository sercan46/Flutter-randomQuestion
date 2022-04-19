import 'package:flutter/material.dart';
import 'package:random_question/core/constants/navigation/navigation_constants.dart';
import 'package:random_question/core/init/navigation/navigation_service.dart';
import 'package:random_question/products/widgets/popup/settings_popup.dart';
import 'package:random_question/products/widgets/text/custom_text.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

class CustomAppBar extends AppBar {
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final SettingPopup _settingPopup = SettingPopup();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      title: const CustomText(text: 'English Question'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {
              _settingPopup.showMyDialog(
                context,
                'Ayarlar',
                addPopupBody(),
                saveData,
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        )
      ],
    );
  }

  saveData() {}

  Widget addPopupBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 9,
                ),
                CustomText(
                  text: 'Dil Değiştir',
                  textStyle: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 9,
                )
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 9,
                ),
                InkWell(
                  onTap: () {
                    NavigationService.instance.navigateToPage(
                        path: NavigationConstants.FAVORITE_LIST);
                  },
                  child: const CustomText(
                    text: 'Favori Sorularımı Göster',
                    textStyle: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 9,
                ),
                InkWell(
                  onTap: (() {
                    _pdfViewerKey.currentState?.openBookmarkView();
                    _settingPopup.showMyDialog(
                      context,
                      'KVKK Metni',
                      openPdf(),
                      saveData,
                    );
                  }),
                  child: const CustomText(
                    text: 'KVKK Politikamız',
                    textStyle: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 9,
                )
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Column(
              children: const [
                SizedBox(
                  height: 9,
                ),
                CustomText(
                  text: 'İletişim',
                  textStyle: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 9,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  openPdf() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SfPdfViewer.network(
        'https://www.mevzuat.gov.tr/mevzuatmetin/1.5.6698.pdf',
        key: _pdfViewerKey,
        enableDoubleTapZooming: true,
        canShowScrollHead: true,
        canShowScrollStatus: true,
      ),
    );
  }
}
