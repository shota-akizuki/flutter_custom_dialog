import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'app_colors.dart' as app_colors;
import 'dialog_message.dart';

class DialogMessageContent extends HookWidget {
  const DialogMessageContent({
    Key? key,
    required this.dialogMessage,
  }) : super(key: key);
  final DialogMessage dialogMessage;

  static const double _buttonHeight = 36;
  static const double _horizontalPadding = 14;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_titleIsNotEmpty)
            const SizedBox(
              height: 28,
            ),
          if (_titleIsNotEmpty) _buildTitle,
          _buildDescription,
          _buildButtons(context),
          const SizedBox(
            height: 34,
          ),
        ],
      ),
    );
  }

  bool get _titleIsNotEmpty =>
      dialogMessage.title != null && dialogMessage.title!.isNotEmpty;

  Widget get _buildTitle => Text(
        dialogMessage.title!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: app_colors.black,
          fontSize: 16,
        ),
      );

  Widget get _buildDescription {
    final descriptionWidget = dialogMessage.description;
    if (descriptionWidget != null) {
      return Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          descriptionWidget,
          const SizedBox(
            height: 43,
          ),
        ],
      );
    }
    return const SizedBox(height: 32);
  }

  Widget _buildButtons(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < dialogMessage.dialogButtons.length; i++) {
      children.add(_buildButton(
        context: context,
        dialogButton: dialogMessage.dialogButtons[i],
      ));
      if (i != dialogMessage.dialogButtons.length - 1) {
        children.add(const SizedBox(
          height: 14,
        ));
      }
    }
    return Column(
      children: children,
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required DialogButton dialogButton,
  }) {
    return GestureDetector(
      onTap: dialogButton.function,
      child: Container(
        height: _buttonHeight,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: dialogButton.buttonColor.backgroundColor,
        ),
        child: Text(
          dialogButton.label,
          style: TextStyle(
            color: dialogButton.buttonColor.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
