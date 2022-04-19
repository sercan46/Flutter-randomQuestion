import 'package:flutter/material.dart';

class SettingPopup {
  Future<void> showMyDialog(BuildContext context, String title, Widget body,
      Function() okeyClick) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.purple[200],
          title: Text(title),
          content: SingleChildScrollView(
            child: body,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Kapat',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
