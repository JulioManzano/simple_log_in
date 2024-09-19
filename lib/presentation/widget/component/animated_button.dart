import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final Function onTap;
  final Function? onLongPress;
  final double? sizeTransform;
  final bool? haveChildButtons;

  const AnimatedButton({
    super.key,
    required this.child,
    required this.onTap,
    this.sizeTransform,
    this.haveChildButtons,
    this.onLongPress,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: widget.sizeTransform != null ? widget.sizeTransform! : 0.1,
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
      behavior: HitTestBehavior.opaque,
      child: Transform.scale(
        scale: _scale!,
        child: IgnorePointer(
          ignoring: widget.haveChildButtons != null ? false : true,
          child: widget.child,
        ),
      ),
      onLongPress: () {
        FocusManager.instance.primaryFocus!.unfocus();

        _controller!.forward();
        Future.delayed(const Duration(milliseconds: 100), () {
          if (widget.onLongPress != null) {
            widget.onLongPress!();
          }
          _controller!.reverse();
        });
      },
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();

        _controller!.forward();
        Future.delayed(const Duration(milliseconds: 100), () {
          widget.onTap();
          _controller!.reverse();
        });
      },
    );
  }
}
