import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {  // Manejador del estado (parecido a un provider)
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit Submit: $state');
  }

  void usernameChanged(String value){ // Métodos que cambian el estado (su copia)
    emit(
      state.copyWith(
        username: value
      )
    );
  }
  void emailChanged(String value){
    emit(
      state.copyWith(
        email: value
      )
    );
  }
  void passwordChanged(String value){
    emit(
      state.copyWith(
        password: value
      )
    );
  }
}
