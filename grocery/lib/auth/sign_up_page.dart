import 'package:flutter/material.dart';

import 'icon_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: primaryColor,
              child: const Center(
                child: Text('Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const IconTextFormField(
                    labelText: 'E-mail',
                    fieldType: IconTextFormFieldType.email,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  const IconTextFormField(
                    labelText: 'Senha',
                    fieldType: IconTextFormFieldType.password,
                    isSecret: true,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  const IconTextFormField(
                    labelText: 'Nome',
                    icon: Icons.person,
                    fieldType: IconTextFormFieldType.text,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  const IconTextFormField(
                    labelText: 'Celular',
                    icon: Icons.phone,
                    fieldType: IconTextFormFieldType.phone,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  const IconTextFormField(
                    labelText: 'CPF',
                    icon: Icons.credit_card,
                    fieldType: IconTextFormFieldType.cpf,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onPressed: _formValidate,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _formValidate() {
    _formKey.currentState?.validate();
  }
}
