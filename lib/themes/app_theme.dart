import 'package:flutter/material.dart';
import 'package:lap_timer/themes/config_constant.dart';

enum VTButtonType {
  primary,
  secondary,
  ghost,
  link,
}

class AppTheme {
  static const Color primary = Color(0xFF057CA5);
  static const Color redPrimary = Color(0xFFD20A32);
  static const Color skyPrimary = Color(0xFF0074c2);
  static const Color yellowPrimary = Color(0xFFFEBA2C);
  static const Color greenPrimary = Color(0xFF34A214);

  static const Color disableColorLight = Color(0xFFAAAAAA);
  static const Color disableColorDark = Color(0xFFEEEEEE);
  static const Color unselectedColorLight = Color(0xFF999999);
  static const Color unselectedColorDark = Color(0xFFEEEEEE);

  static const Color textColorLight = Color(0xFF888888);
  static const Color textColorDark = Color(0xFFCECECE);
  static const Color powderBlue = Color(0xFFa6dade);

  static const Gradient primaryColorGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, redPrimary],
  );

  static const Gradient influencerColorGradient = LinearGradient(
    colors: [
      Color(0xFFC2BEE6),
      Color(0xFFDD9BE1),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient flashSaleColorGradient = LinearGradient(
    colors: [
      Color(0xFFFFAA29),
      Color(0xFFF7750B),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const ColorScheme lightScheme = ColorScheme(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    primary: Color(0xFF057CA5),
    secondary: Color(0xff48B5BD),
    onBackground: Color(0xFF202020),
    onSurface: Colors.black,
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF202020),
    primaryVariant: Color(0xFF017ca6),
    secondaryVariant: Color(0xFF8acfd3),
    error: Color(0xFFCC0035),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );
  static const ColorScheme darkScheme = ColorScheme(
    background: Color(0xFF121212),
    surface: Color(0xFF303030),
    primary: Color(0xFF057CA5),
    secondary: Color(0xFFCECECE),
    onBackground: Color(0xFFCECECE),
    onSurface: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF303030),
    onSecondary: Color(0xFFBDBDBD),
    primaryVariant: Color(0xFF017ca6),
    secondaryVariant: Color(0xFF8acfd3),
    error: Color(0xFFCC0035),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.dark,
  );

  static ThemeData get dark {
    // final _textTheme = textTheme(isDarkMode: true);
    return ThemeData(
      backgroundColor: darkScheme.background,
      colorScheme: darkScheme,
      iconTheme: iconThemeData(isDarkMode: true),
      tabBarTheme: tabBarTheme(isDarkMode: true),
      textTheme: textTheme(isDarkMode: true),
      dividerTheme: dividerThemeData(isDarkMode: true),
      bottomNavigationBarTheme: bottomNavigationBarThemeData(isDarkMode: true),
      pageTransitionsTheme: pageTransitionsTheme(),
      textSelectionTheme: textSelectionThemeData(),
      splashColor: Colors.transparent,
      primaryColor: darkScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        color: darkScheme.surface,
        iconTheme: iconThemeData(isDarkMode: true),
        actionsIconTheme: iconThemeData(isDarkMode: true),
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonStyle(isDarkMode: true, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle(isDarkMode: true, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle(isDarkMode: true, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      buttonTheme: ButtonThemeData(
        hoverColor: darkScheme.primaryVariant,
        highlightColor: darkScheme.primaryVariant,
        splashColor: Colors.transparent,
        disabledColor: disableColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ConfigConstant.radius1),
        ),
      ),
    );
  }

  static ThemeData get light {
    // final _textTheme = textTheme();
    return ThemeData(
      backgroundColor: lightScheme.background,
      colorScheme: lightScheme,
      iconTheme: iconThemeData(isDarkMode: false),
      tabBarTheme: tabBarTheme(isDarkMode: false),
      textTheme: textTheme(isDarkMode: false),
      dividerTheme: dividerThemeData(isDarkMode: false),
      bottomNavigationBarTheme: bottomNavigationBarThemeData(isDarkMode: false),
      pageTransitionsTheme: pageTransitionsTheme(),
      textSelectionTheme: textSelectionThemeData(),
      splashColor: Colors.transparent,
      primaryColor: lightScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        color: lightScheme.primary,
        iconTheme: iconThemeData(isDarkMode: false),
        actionsIconTheme: iconThemeData(isDarkMode: false),
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonStyle(isDarkMode: false, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle(isDarkMode: false, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle(isDarkMode: false, buttonType: VTButtonType.ghost, onlyTextPadding: null),
      ),
      buttonTheme: ButtonThemeData(
        hoverColor: lightScheme.primaryVariant,
        highlightColor: lightScheme.primaryVariant,
        splashColor: Colors.transparent,
        disabledColor: disableColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ConfigConstant.radius1),
        ),
      ),
    );
  }

  static TextSelectionThemeData textSelectionThemeData() {
    return TextSelectionThemeData(
      cursorColor: lightScheme.primary,
      selectionColor: lightScheme.primary.withOpacity(0.1),
    );
  }

  static Color getBackgrounColorByState({
    required Set<MaterialState> states,
    required bool onlyText,
    required VTButtonType buttonType,
    required bool isDarkMode,
  }) {
    Color primaryVariant = isDarkMode ? darkScheme.primaryVariant : lightScheme.primaryVariant;
    Color secondaryVariant = isDarkMode ? darkScheme.secondaryVariant : lightScheme.secondaryVariant;
    Color secondaryButtonColor = isDarkMode ? darkScheme.surface : lightScheme.surface;
    if (onlyText) {
      if (states.contains(MaterialState.pressed)) {
        return primaryVariant.withOpacity(0.0);
      }

      //default
      return Colors.transparent;
    } else {
      if (states.contains(MaterialState.pressed)) {
        return primaryVariant;
      } else if (states.contains(MaterialState.selected)) {
        return primaryVariant;
      } else if (states.contains(MaterialState.error)) {
        return redPrimary;
      } else if (states.contains(MaterialState.disabled)) {
        return secondaryVariant;
      }

      //default
      if (buttonType == VTButtonType.secondary) {
        return secondaryButtonColor; //default secondary backgroundColor
      } else {
        return primary; //default primary backgroundColor
      }
    }
  }

  static ButtonStyle buttonStyle({
    bool isDarkMode = false,
    VTButtonType buttonType = VTButtonType.primary,
    EdgeInsets? onlyTextPadding = EdgeInsets.zero,
  }) {
    bool onlyText = buttonType == VTButtonType.ghost || buttonType == VTButtonType.link;

    var shape = MaterialStateProperty.resolveWith<RoundedRectangleBorder>((Set<MaterialState> states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConfigConstant.radius1),
        side: BorderSide(
          width: 1,
          color: getBackgrounColorByState(
            isDarkMode: isDarkMode,
            states: states,
            onlyText: onlyText,
            buttonType: buttonType,
          ),
        ),
      );
    });

    var side = MaterialStateProperty.resolveWith<BorderSide>((states) {
      if (onlyText) {
        return const BorderSide(width: 0, color: Colors.transparent);
      } else {
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(width: 1, color: lightScheme.primary);
        } else if (states.contains(MaterialState.selected)) {
          return BorderSide(width: 1, color: lightScheme.primaryVariant);
        } else if (states.contains(MaterialState.error)) {
          return BorderSide(width: 1, color: lightScheme.error);
        } else if (states.contains(MaterialState.disabled)) {
          return const BorderSide(width: 1, color: Colors.transparent);
        } else {
          return BorderSide(width: 1, color: lightScheme.primary);
        }
      }
    });

    var foregroundColor = MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (onlyText) {
          if (states.contains(MaterialState.pressed)) {
            return lightScheme.primaryVariant;
          } else if (states.contains(MaterialState.selected)) {
            return lightScheme.primaryVariant;
          } else if (states.contains(MaterialState.error)) {
            return lightScheme.error;
          } else if (states.contains(MaterialState.disabled)) {
            return disableColorLight;
          }

          // default
          if (buttonType == VTButtonType.ghost) {
            return lightScheme.onSurface; //default ghost foregroundColor
          } else {
            return lightScheme.primary; //default link foregroundColor
          }
        } else {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          } else if (states.contains(MaterialState.selected)) {
            return Colors.white;
          } else if (states.contains(MaterialState.error)) {
            return Colors.white;
          } else if (states.contains(MaterialState.disabled)) {
            return disableColorLight;
          }

          // default
          if (buttonType == VTButtonType.secondary) {
            return primary; //default secondary foregroundColor
          } else {
            return Colors.white; //default primary foregroundColor
          }
        }
      },
    );

    var backgroundColor = MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        return getBackgrounColorByState(
          isDarkMode: isDarkMode,
          states: states,
          onlyText: onlyText,
          buttonType: buttonType,
        );
      },
    );

    return ButtonStyle(
      side: side,
      shape: shape,
      enableFeedback: true,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      animationDuration: ConfigConstant.duration,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      minimumSize: MaterialStateProperty.all(onlyText ? Size.zero : null),
      padding: MaterialStateProperty.all(onlyText ? onlyTextPadding : null),
      textStyle: MaterialStateProperty.all(textTheme(isDarkMode: isDarkMode).bodyText2),
      tapTargetSize: onlyText ? MaterialTapTargetSize.shrinkWrap : MaterialTapTargetSize.padded,
    );
  }

  static TabBarTheme tabBarTheme({bool isDarkMode = false}) {
    final Color unselectedLabelColor = isDarkMode ? unselectedColorDark : unselectedColorLight;
    return TabBarTheme(
      labelStyle: textTheme().bodyText2,
      unselectedLabelStyle: textTheme().bodyText2,
      unselectedLabelColor: unselectedLabelColor,
      labelColor: primary,
      labelPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
    );
  }

  static IconThemeData iconThemeData({bool isDarkMode = false}) {
    final Color color = isDarkMode ? darkScheme.onSurface : lightScheme.onSurface;
    return IconThemeData(
      size: ConfigConstant.iconSize2,
      color: color,
    );
  }

  static DividerThemeData dividerThemeData({bool isDarkMode = false}) {
    final Color color = isDarkMode ? darkScheme.secondaryVariant : lightScheme.secondaryVariant;
    return DividerThemeData(thickness: 0.5, color: color);
  }

  static BottomNavigationBarThemeData bottomNavigationBarThemeData({
    bool isDarkMode = false,
  }) {
    final unselectedItemColor = isDarkMode ? darkScheme.secondaryVariant : lightScheme.secondaryVariant;
    return BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: textTheme(isDarkMode: isDarkMode).overline,
      unselectedLabelStyle: textTheme(isDarkMode: isDarkMode).overline,
      backgroundColor: Colors.white,
      selectedItemColor: primary,
      unselectedItemColor: unselectedItemColor,
    );
  }

  /// Text Theme - ref: https://material.io/design/typography/the-type-system.html
  /// Font weight - ref: https://www.npmjs.com/package/postcss-font-weight-names
  /// [100] Thin, Hairline
  /// [200] Extra Light, Ultra Light
  /// [300] Light
  /// [400] Normal, Regular
  /// [500] Medium
  /// [600] Semi Bold, Demi Bold
  /// [700] Bold
  /// [800] Extra Bold, Ultra Bold
  /// [900] Black, Heavy
  static TextTheme textTheme({bool isDarkMode = false}) {
    List<String> fontFamilyFallback1 = ["Anybody"];
    // List<String> fontFamilyFallback2 = ["Rubik", "Kantumruy"];

    TextTheme _black = Typography.material2018().black;
    TextTheme _white = Typography.material2018().white;

    final Color color = isDarkMode ? darkScheme.onSurface : lightScheme.onSurface;
    final Color displayColor = isDarkMode ? textColorDark : textColorLight;
    TextTheme _textTheme = isDarkMode ? _white : _black;
    return _textTheme
        .copyWith(
          headline1: TextStyle(
            fontSize: 98,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          headline2: TextStyle(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          headline3: TextStyle(
            fontSize: 49,
            fontWeight: FontWeight.w400,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          headline4: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            fontFamilyFallback: fontFamilyFallback1,
          ),
          overline: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            fontFamilyFallback: fontFamilyFallback1,
          ),
        )
        .apply(
          bodyColor: color,
          displayColor: displayColor,
        );
  }

  static PageTransitionsTheme pageTransitionsTheme() {
    return const PageTransitionsTheme();
  }
}
