import 'package:formz/formz.dart';

enum EmailError { empty, format } // Define input validation errors

class Email extends FormzInput<String, EmailError> { // Extend FormzInput and provide the input type and error type.

  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);
  
  const Email.pure(): super.pure('');                   // Call super.pure to represent an unmodified form input.

  const Email.dirty(String value): super.dirty(value);  // Call super.dirty to represent a modified form input.


  String? get errorMessage {
    if (isValid || isPure) return null; // Si Email es valid o no se modifico no se devuelve errorMessage. En caso contrario existirá displayError
    if (displayError == EmailError.empty) return 'El campo es requerido'; // Comprobamos si el displayError corresponde a un campo vacio
    if (displayError == EmailError.format) return 'Sin formato de email'; // o a un campo con menos de 6 caracteres.

    return null;
  }

  @override
  EmailError? validator(String value) { // Override validator to handle validating a given input value.

    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if ( !emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
