import 'package:flutter/material.dart';
import '../../../core/utils/const.dart';

class DrawerTemplate extends StatelessWidget {
  const DrawerTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              color: kPrimaryColor,
              padding: const EdgeInsets.all(20),
              child: const FlutterLogo(),
            ),
          ),
          const ItemDrawer(
            text: "Dialogs",
            iconLeft: Icon(Icons.messenger_outlined),
            checked: true,
          ),
          const ItemDrawer(
            text: "Basic Component",
            iconLeft: Icon(Icons.messenger_outlined),
            checked: false,
          ),
          const ItemDrawer(
            text: "Tools",
            iconLeft: Icon(Icons.messenger_outlined),
            checked: false,
          ),
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    super.key,
    this.text,
    this.iconLeft,
    this.iconRight,
    required this.checked,
  });

  final String? text;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      color: checked ? kPrimaryColor.withOpacity(0.7) : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconLeft != null) iconLeft!,
          if (text != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text!,
                style: TextStyle(
                  color: checked ? Colors.white : Colors.black87,
                ),
              ),
            ),
          if (iconRight != null) iconRight!,
        ],
      ),
    );
  }
}
