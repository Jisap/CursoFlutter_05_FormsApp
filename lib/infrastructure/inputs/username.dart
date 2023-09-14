import 'package:formz/formz.dart';


enum UsernameError { empty, length }                              // Define input validation errors


class Username extends FormzInput<String, UsernameError> {        // Extend FormzInput and provide the input type and error type.

  const Username.pure() : super.pure('');                         // Call super.pure to represent an unmodified form input.

  const Username.dirty( String value ) : super.dirty(value);      // Call super.dirty to represent a modified form input.

  String? get errorMessage {
    if( isValid || isPure ) return null; // Si username es valid o no se modifico no se devuelve errorMessage. En caso contrario existirá displayError
    if( displayError == UsernameError.empty ) return 'El campo es requerido'; // Comprobamos si el displayError corresponde a un campo vacio
    if( displayError == UsernameError.length) return 'Mínimo 6 caracteres';   // o a un campo con menos de 6 caracteres.

    return null;
  }

  @override
  UsernameError? validator(String value) {                        // Override validator to handle validating a given input value.

    if( value.isEmpty || value.trim().isEmpty ) return UsernameError.empty;
    if( value.length < 6 ) return UsernameError.length;

    return null;

  }
}
