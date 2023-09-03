import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // Proveedor de estado con cubits
        create: (_) => CounterCubit(), // Instancia de estado del counter_cubit
        child:
            const _CubitCounterView() // La vista _CubitCounterView tendrá acceso a ese estado
        );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    final counterState = context.watch<CounterCubit>().state; // Carga el estado y escucha los valores nuevos que emite.

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${ counterState.transactionCount }'), // Muestra el número de subidas del counter
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('Counter value: ${ state.counter }');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+3'), onPressed: () => {}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () => {}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () => {}),
        ],
      ),
    );
  }
}
