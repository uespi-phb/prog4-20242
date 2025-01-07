import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/shared/widgets/icon_text_form_field.dart';

class ProfileTab extends ConsumerWidget {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();

  ProfileTab({super.key}) {
    _emailController.text = 'john.doe@gmail.com';
    _nameController.text = 'John Doe';
    _phoneController.text = '86994225169';
    _cpfController.text = '12345678900';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil do Usuário',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 25),
        children: [
          IconTextFormField(
            labelText: 'E-mail',
            icon: Icons.email,
            controller: _emailController,
            fieldType: IconTextFormFieldType.email,
            margin: const EdgeInsets.only(bottom: 15),
            readOnly: true,
          ),
          IconTextFormField(
            labelText: 'Nome',
            icon: Icons.person,
            controller: _nameController,
            fieldType: IconTextFormFieldType.text,
            margin: const EdgeInsets.only(bottom: 15),
            readOnly: true,
          ),
          IconTextFormField(
            labelText: 'Celular',
            icon: Icons.phone,
            controller: _phoneController,
            fieldType: IconTextFormFieldType.phone,
            margin: const EdgeInsets.only(bottom: 15),
            readOnly: true,
          ),
          IconTextFormField(
            labelText: 'CPF',
            icon: Icons.credit_card,
            controller: _cpfController,
            fieldType: IconTextFormFieldType.cpf,
            margin: const EdgeInsets.only(bottom: 15),
            readOnly: true,
          ),
          SizedBox(
            height: 45,
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
                //
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
