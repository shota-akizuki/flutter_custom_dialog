import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'app_colors.dart' as app_colors;

class CustomDialog extends HookWidget {
  const CustomDialog({
    Key? key,
    required this.context,
    required this.widget,
  }) : super(key: key);
  final BuildContext context;
  final Widget widget;

  static Future<T?> show<T extends Object>({
    required BuildContext context,
    required Widget widget,
  }) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder(
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return CustomDialog(
            context: context,
            widget: widget,
          );
        },
        opaque: false,
        transitionDuration: const Duration(milliseconds: 100),
        reverseTransitionDuration: const Duration(milliseconds: 100),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static const double _modalHorizontalMargin = 40;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.55),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: app_colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: _modalHorizontalMargin,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [widget],
            ),
          ),
        ),
      ),
    );
  }
}
