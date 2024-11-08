import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import './icon_text_form_field.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const foodCategories = [
      'Frutas',
      'Verduras',
      'Legumes',
      'Carnes',
      'Cereais',
      'Laticíneos'
    ];
    final categories = foodCategories.map(
      (name) => FadeAnimatedText(
        name,
        textStyle: const TextStyle(
          color: Colors.yellow,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children: [
          // Header
          Expanded(
            child: Container(
              color: theme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Green',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Grocery',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: categories.toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Auth Form
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // E-mail Field
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: IconTextFormField(
                      labelText: 'E-mail',
                      icon: Icons.email,
                    ),
                  ),
                  // Password Field
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: IconTextFormField(
                      labelText: 'Senha',
                      icon: Icons.lock,
                      isSecret: true,
                    ),
                  ),
                  // Enter Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Forgot Password Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {},
                      child: const Text('Esqueci a Senha'),
                    ),
                  ),
                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(128),
                          thickness: 2.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('OU'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(128),
                          thickness: 2.0,
                        ),
                      ),
                    ],
                  ),
                  // Create Account Button
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.primaryColor,
                        minimumSize: const Size.fromHeight(48.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        side: BorderSide(
                          width: 2.0,
                          color: theme.primaryColor,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Criar Conta'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
