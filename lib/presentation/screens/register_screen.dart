import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: const _RegisterView(),
    );
  }
}

//---------------------------------------------------------------
//------------------------ _RegisterView ------------------------
//---------------------------------------------------------------
class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------------
//----------------------- _registerForm ----------------------
//------------------------------------------------------------

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre del Usuario',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Correo electrónico',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
        ),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('Crear Usuario'),
        ),
      ],
    ));
  }
}
