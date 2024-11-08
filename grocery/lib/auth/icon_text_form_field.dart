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
  void initState() {
    super.initState();

    obscuredText = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuredText,
      decoration: InputDecoration(
        isDense: true,
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isSecret
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscuredText = !obscuredText;
                  });
                },
                icon: Icon(
                  obscuredText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
      ),
    );
  }
}
