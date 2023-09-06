part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();

}

// Se definen los eventos que modifican el state

class CounterIncreased extends CounterEvent { // Evento que incrementa el state 
  final int value;
  CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {}    // Evento que resetea el state
