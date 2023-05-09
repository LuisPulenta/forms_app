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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _keyForm,
      child: Column(
        children: [
          CustomTextFormField(
              label: 'Nombre del Usuario',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.trim().length < 6) return 'Más de 6 letras';
                return null;
              },
              onChanged: (value) {
                registerCubit.usernameChanged(value);
                _keyForm.currentState!.validate();
              }),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
              label: 'Correo electrónico',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'No tiene formato de correo';
                }
                return null;
              },
              onChanged: (value) {
                registerCubit.emailChanged(value);
                _keyForm.currentState!.validate();
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.trim().length < 6) return 'Más de 6 letras';
              return null;
            },
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _keyForm.currentState!.validate();
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
