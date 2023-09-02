part of 'counter_cubit.dart';


class CounterState{

  final int counter;            // Valores que se reciben
  final int transactionCount;

  CounterState({                // Valores por defecto
    this.counter = 0,
    this.transactionCount = 0,
  });

  copyWith({                    // Estado. Se trabaja con copias de la instancia del estado
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );
}
