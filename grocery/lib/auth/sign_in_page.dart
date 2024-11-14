import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../app/app_routes.dart';
import './icon_text_form_field.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInPage({super.key}) {
    _emailController.text = 'fulano@uespi.br';
    _passwordController.text = '12345678';
  }

  void _validateForm() {
    debugPrint('_validateForm()');

    if (_formKey.currentState?.validate() ?? false) {
      debugPrint('Validation passed');
    } else {
      debugPrint('Validation failed');
    }
    debugPrint('\tEmail: ${_emailController.text}');
    debugPrint('\tSenha: ${_passwordController.text}');
  }

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

    final pageSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageSize.height,
          child: Column(
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
              Container(
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
                // Form fields
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // E-mail Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconTextFormField(
                          labelText: 'E-mail',
                          fieldType: IconTextFormFieldType.email,
                          controller: _emailController,
                        ),
                      ),
                      // Password Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconTextFormField(
                          labelText: 'Senha',
                          fieldType: IconTextFormFieldType.password,
                          isSecret: true,
                          controller: _passwordController,
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
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _validateForm();
                          },
                        ),
                      ),
                      // Forgot Password Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style:
                              TextButton.styleFrom(foregroundColor: Colors.red),
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.signUp);
                          },
                          child: const Text('Criar Conta'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
