import 'package:formz/formz.dart';


enum PasswordError { empty, length }                              // Define input validation errors


class Password extends FormzInput<String, PasswordError> {        // Extend FormzInput and provide the input type and error type.

  const Password.pure() : super.pure('');                         // Call super.pure to represent an unmodified form input.

  const Password.dirty( String value ) : super.dirty(value);      // Call super.dirty to represent a modified form input.

  
  @override
  PasswordError? validator(String value) {                        // Override validator to handle validating a given input value.

    if( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if( value.length < 6 ) return PasswordError.length;

    return null;

  }
}