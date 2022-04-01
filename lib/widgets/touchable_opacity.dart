import 'package:flutter/material.dart';

enum TypeEffectType {
  touchableOpacity,
  scaleDown,
}

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    Key? key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 100),
    this.vibrate = false,
    this.behavior = HitTestBehavior.opaque,
    this.effects = const [
      TypeEffectType.touchableOpacity,
    ],
    this.onLongPressed,
    this.enable = true,
  }) : super(key: key);

  final Widget child;
  final List<TypeEffectType> effects;
  final void Function()? onTap;
  final void Function()? onLongPressed;
  final Duration duration;
  final bool vibrate;
  final HitTestBehavior? behavior;
  final bool? enable;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> with SingleTickerProviderStateMixin {
  final double scaleActive = 1;

  final double opacityActive = 0.65;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: widget.duration,
    );
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.duration = widget.duration;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 1, end: scaleActive).animate(controller);
    final animation2 = Tween<double>(begin: 1, end: widget.enable! ? opacityActive : 1).animate(controller);

    void onTapCancel() => controller.reverse();
    void onTapDown() => controller.forward();
    void onTapUp() => controller.reverse().then((value) => widget.onTap!());

    if (widget.onTap != null) {
      return GestureDetector(
        behavior: widget.behavior,
        onLongPress: widget.onLongPressed,
        onTapDown: (detail) => onTapDown(),
        onTapUp: (detail) => onTapUp(),
        onTapCancel: () => onTapCancel(),
        child: buildChild(controller, animation, animation2),
      );
    } else {
      return buildChild(controller, animation, animation2);
    }
  }

  AnimatedBuilder buildChild(
    AnimationController controller,
    Animation<double> animation,
    Animation<double> animation2,
  ) {
    return AnimatedBuilder(
      child: widget.child,
      animation: controller,
      builder: (context, child) {
        Widget result = child ?? const SizedBox();
        for (var effect in widget.effects) {
          switch (effect) {
            case TypeEffectType.scaleDown:
              result = ScaleTransition(scale: animation, child: result);
              break;
            case TypeEffectType.touchableOpacity:
              result = Opacity(opacity: animation2.value, child: result);
              break;
          }
        }
        return result;
      },
    );
  }
}
