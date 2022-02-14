import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/dialog_message.dart';
import 'custom_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Custom Dialog'),
      ),
      body: Center(
        child: _buildLogoutButton(context),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('ログアウト'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
      ),
      onPressed: () {
        onTap(context);
      },
    );
  }
}

void onTap(BuildContext context) {
  // 必要なパラメータをDialogMessageに渡す
  final confirmMessageWidget = DialogMessage(
    title: '本当にログアウトしますか？',
    description: null,
    dialogButtons: [
      DialogButton(
        label: 'ログアウト',
        buttonColor: ButtonColor.red,
        function: () async {
          // サインアウト処理など
          Navigator.pop(context);
        },
      ),
      DialogButton(
        label: 'キャンセル',
        buttonColor: ButtonColor.gray,
        function: () => Navigator.pop(context),
      )
    ],
  ).buildDialogContent();
  CustomDialog.show(context: context, widget: confirmMessageWidget);
}
