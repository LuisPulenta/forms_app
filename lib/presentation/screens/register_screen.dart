import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
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
      body: BlocProvider(
          create: (context) => RegisterCubit(), child: const _RegisterView()),
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
                size: 150,
              ),
              SizedBox(
                height: 20,
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
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
              label: 'Nombre del Usuario',
              errorMessage: username.errorMessage,
              onChanged: (value) {
                registerCubit.usernameChanged(value);
              }),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              label: 'Correo electrónico',
              errorMessage: email.errorMessage,
              onChanged: (value) {
                registerCubit.emailChanged(value);
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            errorMessage: password.errorMessage,
            onChanged: (value) {
              registerCubit.passwordChanged(value);
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
            onPressed: () {
              // bool isValid = _keyForm.currentState!.validate();
              // if (!isValid) return;
              registerCubit.onSubmit();
            },
          ),
        ],
      ),
    );
  }
}
