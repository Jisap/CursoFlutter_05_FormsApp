import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> { // CounterBloc trabaja con copias del estado de CounterState y sus métodos que lo modifican

  CounterBloc() : super(const CounterState()) { // Constructor que inicializa el estado

    on<CounterIncreased>((event, emit) {        // Este Bloc(estado) escucha el evento CounterIncreased y en respuesta emite un nuevo state
      emit( state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      )); 
    });
  }
}
