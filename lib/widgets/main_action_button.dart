import 'package:flutter/material.dart';
import 'package:lap_timer/themes/config_constant.dart';
import 'package:lap_timer/widgets/touchable_opacity.dart';

class MainActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final BoxBorder? border;
  const MainActionButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.margin,
    this.color,
    this.textColor,
    this.padding,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPressed,
      child: Container(
        margin: margin ?? const EdgeInsets.all(20),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: ConfigConstant.buttonRaduis,
          border: border,
          gradient: color == null
              ? const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff20bf55),
                    Color(0xff01baef),
                  ],
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.surface,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
