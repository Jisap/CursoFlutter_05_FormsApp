import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  // Manejador del estado (parecido a un provider)
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    print('Cubit Submit: $state');
  }

  void usernameChanged(String value) {
    // Métodos que cambian el estado (su copia)

    final username = Username.dirty(
        value); // Creamos una variable que recoge el value que cambio y lo asigna al campo Username que altera el state

    emit(// Se emite
        state.copyWith(
            // una copia de la instancia del state
            username: username, // con ese cambio de estate del username
            isValid: Formz.validate([
              username
            ]) // con la validación establecida en el imput de tipo Username
        ));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
        password, state.username
      ])
    ));
  }
}
