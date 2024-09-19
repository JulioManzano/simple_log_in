import 'package:flutter/material.dart';

import '../../../core/utils/const.dart';
import 'animated_button.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.bgColor,
    this.centerTitle = false,
    this.leading = true,
    this.drawer = false,
    this.titleSpacing = 0,
    this.actions,
  });

  final String? title;
  final bool centerTitle;
  final bool leading;
  final bool drawer;
  final Color? bgColor;
  final double titleSpacing;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? kPrimaryColor,
      leading: drawer
          ? AnimatedButton(
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : leading
              ? AnimatedButton(
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              : null,
      actions: actions,
      titleSpacing: titleSpacing,
      centerTitle: centerTitle,
      title: title == null
          ? null
          : Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
