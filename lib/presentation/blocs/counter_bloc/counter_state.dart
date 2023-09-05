part of 'counter_bloc.dart';

class CounterState extends Equatable {

  final int counter;                      // Valores que se reciben
  final int transactionCount;

  const CounterState({                    // Valores por defecto
    this.counter = 10, 
    this.transactionCount = 0
  });

  CounterState copyWith({                 // Estado. Se trabaja con copias de la instancia del estado
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount:  transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [counter, transactionCount];
}

final class CounterInitial extends CounterState {}
