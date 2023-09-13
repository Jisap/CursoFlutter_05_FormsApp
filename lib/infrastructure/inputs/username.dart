import 'package:formz/formz.dart';


enum UsernameError { empty, length }                              // Define input validation errors


class Username extends FormzInput<String, UsernameError> {        // Extend FormzInput and provide the input type and error type.

  const Username.pure() : super.pure('');                         // Call super.pure to represent an unmodified form input.

  const Username.dirty( String value ) : super.dirty(value);      // Call super.dirty to represent a modified form input.

  
  @override
  UsernameError? validator(String value) {                        // Override validator to handle validating a given input value.

    if( value.isEmpty || value.trim().isEmpty ) return UsernameError.empty;
    if( value.length < 6 ) return UsernameError.length;

    return null;

  }
}
