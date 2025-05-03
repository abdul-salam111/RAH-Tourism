import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showSnackbar({
    required BuildContext context,
    required String message,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color textcolor = blackcolor,
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: style(color: textcolor),
        ),
        clipBehavior: Clip.antiAlias,
        backgroundColor: backgroundColor,
        duration: duration,
        action: actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: onActionPressed ?? () {},
                textColor: redColor,
              )
            : null,
      ),
    );
  }
}
