import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {  // Manejador del estado (parecido a un provider)
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,               // Ponemos el estatus del formulario en validating mientras validadmos los campos. 
        username: Username.dirty( state.username.value ),// "Ensuciamos" el estado de username para que realize las validaciones oportunas
        password: Password.dirty( state.password.value ),// Ensuciar implica poner el value del input que se haya o no introducido.
        email: Email.dirty(state.email.value),

        isValid: Formz.validate([
          state.username,
          state.password,
          state.email,
        ])
      )
    );


    print('Cubit Submit: $state');
  }

  void usernameChanged(String value) {                // Métodos que cambian el estado (su copia)

    final username = Username.dirty(value);           // Creamos una variable que recoge el value que cambio y lo asigna al campo Username que altera el state

    emit(                                             // Se emite
        state.copyWith(                               // una copia de la instancia del state
            username: username,                       // con ese cambio de estate del username
            isValid: Formz.validate([ username, state.password, state.email]) // con la validación establecida en el input de tipo Username y password
        ));
  }

  void emailChanged(String value) {

    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.username, state.password])  
      ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email])
    ));
  }
}
