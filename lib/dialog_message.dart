import 'package:flutter/material.dart';

import 'app_colors.dart' as app_colors;
import 'dialog_message_content.dart';

class DialogMessage {
  DialogMessage({
    this.title,
    required this.description,
    required this.dialogButtons,
  });
  final String? title;
  final Widget? description;
  final List<DialogButton> dialogButtons;

  Widget buildDialogContent() {
    return DialogMessageContent(
      dialogMessage: this,
    );
  }

  static Widget buildDescriptionFromString(String description) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: app_colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  static DialogButton buildErrorDialogButton(BuildContext context) {
    return DialogButton(
      label: 'OK',
      buttonColor: ButtonColor.blue,
      function: () => Navigator.pop(context),
    );
  }
}

class DialogButton {
  DialogButton({
    required this.label,
    required this.buttonColor,
    required this.function,
  });
  ButtonColor buttonColor;
  String label;
  Function()? function;
}

extension ButtonColorExtension on ButtonColor {
  Color get backgroundColor => _backgroundColors[this]!;

  Color get textColor => _textColors[this]!;

  static const _backgroundColors = {
    ButtonColor.blue: app_colors.blue500,
    ButtonColor.red: app_colors.red500,
    ButtonColor.gray: app_colors.gray100,
  };

  static const _textColors = {
    ButtonColor.blue: app_colors.white,
    ButtonColor.red: app_colors.white,
    ButtonColor.gray: app_colors.black,
  };
}

enum ButtonColor {
  blue,
  red,
  gray,
}
