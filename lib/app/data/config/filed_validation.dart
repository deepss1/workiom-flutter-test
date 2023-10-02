import 'package:get/get.dart';

class AppValidation {
  static String? emailValidation(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter email';
    } else if (!GetUtils.isEmail(value!)) {
      return 'Enter valid email';
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter password';
    }
    return null;
  }

  static String? temamNameValidation(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter company or team name';
    }
    return null;
  }

  static String? firstNameValidation(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter first name';
    }
    return null;
  }

  static String? lastNameValidation(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter last name';
    }
    return null;
  }
}
