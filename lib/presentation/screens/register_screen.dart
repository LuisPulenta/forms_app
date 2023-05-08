import 'package:flutter/material.dart';

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
    return const Center(
      child: Text('RegisterScreen'),
    );
  }
}
