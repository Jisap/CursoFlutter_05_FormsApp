import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> { // CounterBloc trabaja con copias del estado de CounterState y sus métodos que lo modifican

  CounterBloc() : super(const CounterState()) { // Constructor que inicializa el estado

    on<CounterIncreased>( _onCounterIncreased );  // Este Bloc(estado) escucha el evento CounterIncreased y en respuesta emite un nuevo state
  
    on<CounterReset>( _onCounterReset );
  }

  void _onCounterIncreased( CounterIncreased event, Emitter<CounterState> emit ){  
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    )); 
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }

}
