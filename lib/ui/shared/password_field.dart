import 'package:addict_tool/ui/shared/svg_render_widget.dart';
import 'package:addict_tool/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordField extends HookWidget {
  final ValueChanged<String>? onChanged;

  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? hintText;
  final VoidCallback? onEditingComplete;
  final bool autofocus;

  const PasswordField({
    Key? key,
    this.onChanged,
    this.controller,
    this.autofocus = false,
    this.hintText,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);
    void toggleShowPassword() => showPassword.value = !showPassword.value;
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      obscureText: !showPassword.value,
      onChanged: onChanged,
      validator: validator,
      autofillHints: const [AutofillHints.password],
      inputFormatters: [FilteringTextInputFormatter.deny(' ')],
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      obscuringCharacter: '*',
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
            icon: !showPassword.value
                ? const Icon(Icons.remove_red_eye_outlined, size: 20)
                : const SvgRenderWidget(svgPath: AssetPath.eyeCloseSvg),
            onPressed: toggleShowPassword,
          )),
    );
  }
}
