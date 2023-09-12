part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable { // Estado del formulario


  final FormStatus formStatus; // Valores que se reciben
  final String username;
  final String email;
  final String password;

  const RegisterFormState({   // Valores por defecto
    this.formStatus = FormStatus.invalid, 
    this.username = '', 
    this.email = '', 
    this.password = '',
  });

  RegisterFormState copyWith({ // Estado. Se trabaja con copias de la instancia del estado
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,

  }) => RegisterFormState(

    formStatus: formStatus ?? this.formStatus, // Si existe el valor se aplica y sino el valor por defecto.
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password
  );

  @override
  List<Object> get props => [ formStatus, username, email, password ]; // Permite a equatable cuando el estado a cambiado en base a estas props
}


