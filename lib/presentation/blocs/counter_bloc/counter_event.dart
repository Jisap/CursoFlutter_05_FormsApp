part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();

}

class CounterIncreased extends CounterEvent { // Evento que modifica el state

  final int value;

  CounterIncreased(this.value);
}
