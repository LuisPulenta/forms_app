import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

//---------------------------------------------------------
//------------------- _CubitCounterView -------------------
//---------------------------------------------------------
class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              context.read<CounterCubit>().reset(),
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('Estado cambió');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              increaseCounterBy(context, 3);
            },
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              increaseCounterBy(context, 2);
            },
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              increaseCounterBy(context);
            },
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
