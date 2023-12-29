import 'package:email_validator/email_validator.dart';

class Validator {
  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "Can not be blank";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? baseValidator(value) {
    if (value == null || value.isEmpty) {
      return "Can not be blank";
    }
    return null;
  }
}
