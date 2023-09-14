import 'package:formz/formz.dart';


enum PasswordError { empty, length }                              // Define input validation errors


class Password extends FormzInput<String, PasswordError> {        // Extend FormzInput and provide the input type and error type.

  const Password.pure() : super.pure('');                         // Call super.pure to represent an unmodified form input.

  const Password.dirty( String value ) : super.dirty(value);      // Call super.dirty to represent a modified form input.

  String? get errorMessage {
    if (isValid || isPure) return null; // Si username es valid o no se modifico no se devuelve errorMessage. En caso contrario existirá displayError
    if (displayError == PasswordError.empty) return 'El campo es requerido'; // Comprobamos si el displayError corresponde a un campo vacio
    if (displayError == PasswordError.length) return 'Mínimo 6 caracteres';  // o a un campo con menos de 6 caracteres.

    return null;
  }
  
  @override
  PasswordError? validator(String value) {                        // Override validator to handle validating a given input value.

    if( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if( value.length < 6 ) return PasswordError.length;

    return null;

  }
}