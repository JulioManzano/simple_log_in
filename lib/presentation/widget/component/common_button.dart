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
  final double iconSizeSpace;
  final double fontSize;
  final double? maxWidth;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  final bool expanded;
  final bool invertIcon;
  final bool shadow;
  final MainAxisAlignment? mainAxisAlignment;

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
    this.maxWidth,
    this.iconSizeSpace = 20,
    this.fontSize = 15,
    this.padding,
    this.fontWeight,
    this.mainAxisAlignment,
    this.expanded = true,
    this.invertIcon = true,
    this.shadow = false,
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
          padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12),
          height: widget.height,
          constraints: widget.maxWidth != null
              ? BoxConstraints(
                  maxWidth: widget.maxWidth!,
                )
              : null,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius ??
                const BorderRadius.all(Radius.circular(45)),
            border: widget.borderColor == null
                ? null
                : Border.all(width: 2, color: widget.borderColor!),
            boxShadow: widget.shadow
                ? const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.black26,
                    )
                  ]
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                widget.mainAxisAlignment ?? MainAxisAlignment.center,
            mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (widget.icon != null && widget.iconSizeSpace != 0)
                if (widget.icon != null)
                  !widget.invertIcon
                      ? widget.icon!
                      : SizedBox(width: widget.iconSizeSpace),
              Flexible(
                child: Text(
                  widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight ?? FontWeight.w600,
                    color: widget.textColor ?? Colors.white,
                  ),
                ),
              ),
              if (widget.icon != null)
                widget.invertIcon
                    ? widget.icon!
                    : SizedBox(width: widget.iconSizeSpace),
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
