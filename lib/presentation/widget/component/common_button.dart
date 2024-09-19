import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final Widget? icon;
  final String text;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final double height;
  final double percentScreen;
  final double iconSizeSpace;
  final double fontSize;
  final EdgeInsets? margin;

  const CommonButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
    this.onLongPress,
    required this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.height = 50,
    this.iconSizeSpace = 30,
    this.fontSize = 15,
    this.percentScreen = 1,
    this.margin,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  double? _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;

    return GestureDetector(
      child: Transform.scale(
        scale: _scale!,
        child: Container(
          margin: widget.margin,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          width: MediaQuery.of(context).size.width * widget.percentScreen,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius ??
                const BorderRadius.all(Radius.circular(45)),
            border: widget.borderColor == null
                ? null
                : Border.all(width: 2, color: widget.borderColor!),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) SizedBox(width: widget.iconSizeSpace),
              Flexible(
                child: Text(
                  widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                  ),
                ),
              ),
              if (widget.icon != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: widget.icon,
                ),
            ],
          ),
        ),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();

        _controller!.forward();
        Future.delayed(const Duration(milliseconds: 100), () {
          widget.onTap();
          _controller!.reverse();
        });
      },
      onLongPress: () {
        widget.onLongPress?.call();
      },
    );
  }
}
