import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  Color get primaryColor => themeData.primaryColor;

  Color get cardColor => themeData.cardColor;

  Color get errorColor => themeData.colorScheme.error;

  Color get secondaryColor => themeData.colorScheme.secondary;

  Color get scaffoldBackgroundColor => themeData.scaffoldBackgroundColor;

  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Reserved for [textfield] input, consider using [headlineMedium] instead
  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get titleSmall => textTheme.titleSmall;

  double get height => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get width => MediaQuery.of(this).size.width;

  InputDecorationTheme get inputDecorationTheme =>
      themeData.inputDecorationTheme;

  T customTheme<T>() => Theme.of(this).extension<T>()!;

  T arg<T>() => ModalRoute.of(this)!.settings.arguments as T;

  bool get canPop => Navigator.of(this).canPop();

  void popToFirstScreen() =>
      Navigator.of(this).popUntil((route) => route.isFirst);

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void openDrawer() => Scaffold.of(this).openDrawer();

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.push<T>(
          this,
          MaterialPageRoute(
              builder: (context) => widget,
              fullscreenDialog: fullscreenDialog));

  void pushReplacement(Widget widget) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => widget));

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

  void closeDrawer() => Scaffold.of(this).closeDrawer();

  bool get isSmallScreen => (height / width) < 1.61;

  Future showPlatformAlertDialog(
      {required String title,
      String? message,
      Widget? content,
      String yesActionText = 'Yes',
      String cancelText = 'Cancel',
      VoidCallback? onYesAction}) {
    return showDialog(
        context: this,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: message != null ? Text(message) : content,
              actions: [
                CupertinoDialogAction(
                    onPressed: context.pop, child: Text(cancelText)),
                CupertinoDialogAction(
                    onPressed: () {
                      context.pop();
                      onYesAction?.call();
                    },
                    child: Text(yesActionText)),
              ],
            );
          } else {
            return AlertDialog(
              title: Text(title),
              content: message != null ? Text(message) : content,
              actions: [
                TextButton(
                  onPressed: context.pop,
                  child: Text(cancelText),
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                    onYesAction?.call();
                  },
                  child: Text(yesActionText),
                ),
              ],
            );
          }
        });
  }

  EdgeInsetsGeometry get bottomPaddingForTextField =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);
}
