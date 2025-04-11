import 'package:impact_zone/export.dart';

/*========================Email Validator==============================================*/
class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return keyEmailEmpty.tr;
    } else if (!GetUtils.isEmail(value.trim())) {
      return keyInvalidEmail.tr;
    }
    return null;
  }
}

/*================================================== Phone Number Validator ===================================================*/

class PhoneNumberValidate {
  static String? validateMobile(String value, {FocusNode? focusNode}) {
    if (value.isEmpty) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyPhoneEmEmpty.tr;
    } else if (value.length < 8 || value.length > 15) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keyPhoneNumberInvalid.tr;
    } else if (!validateNumber(value)) {
      if (focusNode != null) {
        focusNode.unfocus();
        focusNode.requestFocus();
      }
      return keySpecialCharacter.tr;
    }
    return null;
  }
}

bool validateNumber(String value) {
  var pattern = r'^[0-9]+$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

/*================================================== Password Validator ===================================================*/

class PasswordFormValidator {

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return keyPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    }
    return null;
  }

  static String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return keyNewPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidNewPassword.tr;
    }
    return null;
  }

  static String? validateConfirmPassword(
      {String? value, String? password}) {
    if (value!.isEmpty) {
      return keyCPasswordEmpty.tr;
    } else if (value.length < 8) {
      return keyInvalidPassword.tr;
    } else if (value != password) {
      return keyPasswordMatch.tr;
    }
    return null;
  }
}

/*===============================Field Checker=================================================*/
class OtpFormValidator {
  static String? validateOtpField({String? value}) {
    if (value == null || value.toString().trim().isEmpty) {
      return "OTP ${keyCannotBeEmpty.tr}";
    }else if (value.length < 4 ||value.length > 4) {
      return keyInvalidOTP.tr;
    }
    return null;
  }
}

/*===============================Field Checker=================================================*/
class FieldChecker {
  static String? fieldChecker({String? value, message}) {
    if (value == null || value.toString().trim().isEmpty) {
      return "$message ${keyCannotBeEmpty.tr}";
    }
    return null;
  }
}

// /// Uppercase text formater
// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) =>
//       TextEditingValue(
//           text: newValue.text.toUpperCase(), selection: newValue.selection);
// }
