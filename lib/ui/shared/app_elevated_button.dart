import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ValueNotifier<bool> _enableButtonNotifier;
  final Stream<bool>? loading;
  final ButtonStyle? style;

  AppElevatedButton(
      {Key? key,
      required this.label,
      this.loading,
      required this.onPressed,
      this.style,
      ValueNotifier<bool>? enable})
      : _enableButtonNotifier = enable ?? ValueNotifier<bool>(true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _enableButtonNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return StreamBuilder<bool>(
          stream: loading,
          initialData: false,
          builder: (context, snapshot) {
            if (snapshot.data ?? false) {
              return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(),
                  child: const CupertinoActivityIndicator());
            }
            return ElevatedButton(
                style: style,
                onPressed: value ? onPressed : null,
                child: child);
          },
        );
      },
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {Key? key, required this.onPressed, required this.label})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text(label));
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(label));
  }
}
