import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc/counter_bloc.dart';


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),      // Proporcionamos el estado(CounterBloc) al screen atraves de un provider via view
      child: const BlocCounterView()
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [int value = 1]){ // Utilizamos el método del CounterBloc para aumentar el estado del counter
    context.read<CounterBloc>()
      .add( CounterIncreased(value) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(                                                        // Del context seleccionamos
          (CounterBloc bloc) => Text('Bloc Counter ${bloc.state.transactionCount}')), // el valor del transactionCount del state de counterBloc
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()), // Llamado al método de reseteo 
            icon: const Icon( Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: context.select(                                                                // Del context seleccionamos
          (CounterBloc counterBloc) => Text('Counter value: ${ counterBloc.state.counter }')  // el valor del counter del state de counterBloc
        ) ,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),  
            onPressed: () => increaseCounterBy(context, 3)
          ),

          const SizedBox(height: 15,),

          FloatingActionButton(
            heroTag: '2', 
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2)
          ),

          const SizedBox( height: 15,),

          FloatingActionButton(
            heroTag: '3', 
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context, 1)
          ),
        ],
      ),
    );
  }
}