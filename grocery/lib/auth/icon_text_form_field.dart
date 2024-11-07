import 'package:flutter/material.dart';

class IconTextFormField extends StatefulWidget {
  final String? labelText;
  final IconData? icon;
  final bool isSecret;

  const IconTextFormField({
    super.key,
    this.labelText,
    this.icon,
    this.isSecret = false,
  });

  @override
  State<IconTextFormField> createState() => _IconTextFormFieldState();
}

class _IconTextFormFieldState extends State<IconTextFormField> {
  bool obscuredText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isSecret,
      decoration: InputDecoration(
        isDense: true,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isSecret
            ? IconButton(
                onPressed: () {
                  debugPrint('OLHO');
                },
                icon: const Icon(Icons.visibility),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
      ),
    );
  }
}
