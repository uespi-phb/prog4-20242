import 'package:flutter/material.dart';
import 'package:grocery/utils/validators/phone_validator.dart';

import '../utils/validators/composite_validator.dart';
import '../utils/validators/cpf_validator.dart';
import '../utils/validators/max_length_validator.dart';
import './icon_text_form_field.dart';
import '../utils/validators/email_validator.dart';
import '../utils/validators/min_length_validator.dart';

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
                  IconTextFormField(
                    labelText: 'E-mail',
                    fieldType: IconTextFormFieldType.email,
                    icon: Icons.email,
                    validator: EmailValidator('E-mail'),
                    margin: const EdgeInsets.only(bottom: 15.0),
                  ),
                  IconTextFormField(
                    labelText: 'Senha',
                    fieldType: IconTextFormFieldType.password,
                    icon: Icons.lock,
                    isSecret: true,
                    validator: MinLengthValidator('Senha', 6),
                    margin: const EdgeInsets.only(bottom: 15.0),
                  ),
                  IconTextFormField(
                    labelText: 'Nome',
                    icon: Icons.person,
                    fieldType: IconTextFormFieldType.text,
                    validator: CompositeValidator(
                      'Nome',
                      [
                        MinLengthValidator('Nome', 5),
                        MaxLengthValidator('Nome', 50),
                      ],
                    ),
                    margin: const EdgeInsets.only(bottom: 15.0),
                  ),
                  IconTextFormField(
                    labelText: 'Celular',
                    icon: Icons.phone,
                    fieldType: IconTextFormFieldType.phone,
                    validator: PhoneValidator('Celular'),
                    margin: const EdgeInsets.only(bottom: 15.0),
                  ),
                  IconTextFormField(
                    labelText: 'CPF',
                    icon: Icons.credit_card,
                    fieldType: IconTextFormFieldType.cpf,
                    validator: CpfValidator('CPF'),
                    margin: const EdgeInsets.only(bottom: 15.0),
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
