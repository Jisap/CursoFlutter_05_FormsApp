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

    final counterState = context.watch<CounterCubit>().state; // Carga el estado y escucha los valores nuevos que emite -> redibuja el widget
    

    void increaseCounterBy( BuildContext context, [int value = 1]){
      context.read<CounterCubit>().increaseBy(value);
    }

    return Scaffold(
      appBar: AppBar(
        //title: context.select(( CounterCubit value )){
        //  return Text('Cubit Counter: ${ value.state.transactionCount })  
        //}
        title: Text('Cubit Counter: ${ counterState.transactionCount }'), // Muestra el número de subidas del counter
        actions: [
          IconButton(
              onPressed: () => {context.read<CounterCubit>().reset()}, // Método de reset del state
              icon: const Icon(Icons.refresh_outlined)
          )
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
              heroTag: '1', child: const Text('3'), onPressed: () => {increaseCounterBy(context, 3)}
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () => {increaseCounterBy(context, 2)}
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () => {increaseCounterBy(context, 2)}
          ),
        ],
      ),
    );
  }
}
