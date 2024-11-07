import 'package:flutter/material.dart';

import './icon_text_form_field.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 40.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: IconTextFormField(
                      labelText: 'E-mail',
                      icon: Icons.email,
                    ),
                  ),
                  IconTextFormField(
                    labelText: 'Senha',
                    icon: Icons.lock,
                    isSecret: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
