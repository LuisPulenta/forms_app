import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('BLoC'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/blocs'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: const Text('Nuevo Usuario'),
            subtitle: const Text('Manejo de Formularios'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
