import 'package:flutter_bloc/flutter_bloc.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {          // Manejador del estado (parecido a un provider)
  CounterCubit() : super(CounterState( counter: 5 ));

  void increaseBy( int value ) {  // Método que emite un nuevo estado
    emit( state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {                  // Método que resetea el estado
    emit(state.copyWith(
      counter: 0,
    ));
  }


}
