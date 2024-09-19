import 'package:flutter/material.dart';
import '../../presentation/widget/dialog/basic_dialog.dart';

class HelperDialog {
  static showSnackBar(
    BuildContext context, {
    required String title,
    SnackBarAction? action,
    ShapeBorder? shape,
  }) {
    SnackBar snackBar = SnackBar(
      content: Text(title),
      action: action,
      shape: shape,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<bool?> customDialogBasic(BuildContext context, {
    String? title,
    String? description,
    Widget? bottom,
    Widget? top,
    bool isDismissible = true,
    String? textAccept,
    String? textCancel,
  }) async {
    bool? res = await showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: isDismissible,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) {
        return BasicDialog(
          title: title,
          description: description,
          bottom: bottom,
          top: top,
          textAccept: textAccept,
          textCancel: textCancel,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
    return res;
  }
}
