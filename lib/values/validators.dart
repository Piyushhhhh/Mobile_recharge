import 'package:mobile_recharge/values/strings.dart';

class Validator {
  static String? validateNickname(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.nicknameRequired;
    }
    if (value.length > 20) {
      return Strings.nicknameMaxLength;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.phoneNumberRequired;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return Strings.phoneNumberInvalid;
    }
    return null;
  }
}
