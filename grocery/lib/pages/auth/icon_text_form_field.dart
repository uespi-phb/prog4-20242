import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../shared/validators/validator.dart';

enum IconTextFormFieldType {
  text,
  password,
  email,
  phone,
  cpf,
}

class IconTextFormField extends StatefulWidget {
  final String? labelText;
  final IconData? icon;
  final bool isSecret;
  final IconTextFormFieldType fieldType;
  final EdgeInsetsGeometry margin;
  final TextEditingController? controller;
  final Validator? validator;
  final String? hintText;
  final InputBorder? border;

  const IconTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.icon,
    this.validator,
    this.hintText,
    this.border,
    this.fieldType = IconTextFormFieldType.text,
    this.margin = EdgeInsets.zero,
    this.isSecret = false,
  });

  @override
  State<IconTextFormField> createState() => _IconTextFormFieldState();
}

class _IconTextFormFieldState extends State<IconTextFormField> {
  TextInputFormatter? inputFormatter;
  bool obscuredText = false;

  @override
  void initState() {
    super.initState();

    _setInputFormatter();

    obscuredText = widget.isSecret;
  }

  void _setInputFormatter() {
    String? mask;
    Map<String, RegExp>? filter;

    switch (widget.fieldType) {
      case IconTextFormFieldType.text:
        break;
      case IconTextFormFieldType.password:
        break;
      case IconTextFormFieldType.email:
        break;
      case IconTextFormFieldType.phone:
        mask = '(##) #####-####';
        filter = {
          '#': RegExp(r'\d'),
        };
        break;
      case IconTextFormFieldType.cpf:
        mask = '###.###.###-##';
        filter = {
          '#': RegExp(r'\d'),
        };
        break;
    }

    inputFormatter = MaskTextInputFormatter(
      mask: mask,
      filter: filter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final inputFormatters = (inputFormatter != null) ? [inputFormatter!] : null;

    return Padding(
      padding: widget.margin,
      child: TextFormField(
        validator: widget.validator?.validate,
        inputFormatters: inputFormatters,
        controller: widget.controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
          isDense: true,
          labelText: widget.labelText,
          hintText: widget.hintText,
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
          border: widget.border ??
              const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
              ),
        ),
      ),
    );
  }
}
