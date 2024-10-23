import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Validations {
  static const int emailMaxLength = 30;
  static const int fullNameMaxLength = 20;
  static const int passwordMaxLength = 15;
  static const int phoneMaxLength = 10;
  static const int bioMaxLength = 200;
  static const int titleMaxLength = 160;
  static const int descriptionMaxLength = 500;
  static const int reviewMaxLength = 500;
  static const int otpMaxLength = 6;
  static FilteringTextInputFormatter emailFilterFormat =
      FilteringTextInputFormatter.allow(
    RegExp("[a-z0-9A-Z@.]"),
  );

  static FilteringTextInputFormatter passwordFilterFormat =
      FilteringTextInputFormatter.allow(
    RegExp("[a-z0-9A-Z!@#\$%^&*]"),
  );

  static FilteringTextInputFormatter nameFilterFormat =
      FilteringTextInputFormatter.allow(
    RegExp("[a-zA-Z ]"),
  );

  static FilteringTextInputFormatter nameAndYearFilterFormat =
      FilteringTextInputFormatter.allow(
    RegExp("[a-zA-Z0-9 ]"),
  );

  static FilteringTextInputFormatter numbersFilterFormat =
      FilteringTextInputFormatter.allow(
    RegExp("[0-9]"),
  );

  static String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'emptyNameError'.tr();
    }
    // else if (value.length < 3) {
    //   return Constants.nameError;
    // }
    else {
      return null;
    }
  }

  static String? reviewDetailValidator(String value) {
    if (value.isEmpty) {
      return 'emptyReviewError'.tr();
    } else {
      return null;
    }
  }

  static String? fullNameValidator(String value) {
    if (value.isEmpty) {
      return 'emptyFullnameError'.tr();
    } else if (value.length < 3) {
      return 'nameError'.tr();
    } else {
      return null;
    }
  }

  static String? emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'emailError'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'invalidEmailError'.tr();
    } else {
      return null;
    }
  }

  static String? pwdValidator(String value, {String? emptyError}) {
    String pattern =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return emptyError ?? 'passblank'.tr();
    } else if (value.length < 8) {
      return 'passError'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'passwordShouldContain'.tr();
    } else {
      return null;
    }
  }

  static String? oldPwdValidator(String value, {String? emptyError}) {
    String pattern =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return emptyError ?? 'oldPassblank'.tr();
    } else if (value.length < 8) {
      return 'passError'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'passwordShouldContain'.tr();
    } else {
      return null;
    }
  }

  static String? newPwdValidator(String value) {
    String pattern =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'newPassblank'.tr();
    } else if (value.length < 8) {
      return 'passError'.tr();
    } else if (!regex.hasMatch(value)) {
      return 'passwordShouldContain'.tr();
    } else {
      return null;
    }
  }

  static String? confirmPwdValidator(String value, String pass,
      {String? errorMsg, String? emptyError}) {
    String pattern =
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) return emptyError ?? 'conPassError'.tr();
    if (value != pass) return errorMsg ?? 'confirmPassError'.tr();
    if (!regex.hasMatch(value)) {
      return 'passwordShouldContain'.tr();
    }
    return null;
  }

  static String? mobileValidator(String value) {
    if (value.isEmpty) {
      return 'mobileBlank'.tr();
    } else if (value.length < 10) {
      return 'mobileError'.tr();
    } else {
      return null;
    }
  }

  static String? otpValidator(String value) {
    if (value.isEmpty) {
      return 'otpBlank'.tr();
    } else if (value.length < 6) {
      return 'otpError'.tr();
    } else {
      return null;
    }
  }

  static String? otp4Validator(String value, String? otp) {
    if (value.isEmpty) {
      return 'otpBalnk'.tr();
    } else if (value.length < 4) {
      return 'otpError'.tr();
    } else if (value != otp) {
      return 'otpError'.tr();
    } else {
      return null;
    }
  }

  static String? emptyValidator(String value, {required String errorName}) {
    if (value.isEmpty) {
      return errorName;
    } else {
      return null;
    }
  }

  static String? closeTimeEventValidatore(String starttime, String closetime){
    if (closetime.isEmpty) {
      return 'closeTimeError'.tr();
    } else {
      DateTime startDateTime = DateFormat('MM/dd/yyyy hh:mm a').parse(starttime);
      DateTime endDateTime = DateFormat('MM/dd/yyyy hh:mm a').parse(closetime);

      // Compare endDateTime with startDateTime
      int comparisonResult = endDateTime.compareTo(startDateTime);

      // Check if endDateTime is greater than startDateTime
      if (comparisonResult > 0) {
       return null;
      } else if (comparisonResult < 0) {
        return 'closeIsLessError'.tr();
      } else {
        return 'closeIsLessError'.tr();
      }
    }
  }

  static bool closeTimeEventValidatoreBool(String? starttime, String? closetime){
    if (closetime!.isEmpty) {
      return false;
    } else {
      DateTime startDateTime = DateFormat('MM/dd/yyyy hh:mm a').parse(starttime!);
      DateTime endDateTime = DateFormat('MM/dd/yyyy hh:mm a').parse(closetime!);

      // Compare endDateTime with startDateTime
      int comparisonResult = endDateTime.compareTo(startDateTime);

      // Check if endDateTime is greater than startDateTime
      if (comparisonResult > 0) {
        return true;
      } else if (comparisonResult < 0) {
        return false;
      } else {
        return false;
      }
    }
  }

  static String? closeTimeValidatore(String starttime, String closetime) {

    if (closetime.isEmpty) {
      return 'closeTimeError'.tr();
    } else {
      TimeOfDay openTime = parseTimeString(starttime);
      TimeOfDay closeTime = parseTimeString(closetime);

      if(!isCloseTimeValid(openTime, closeTime)){
        return 'closeIsLessError'.tr();
      }
      return null;
    }
  }

  static String? validateTimes(TimeOfDay open, TimeOfDay close) {
    if (close==null) {
      return 'closeTimeError'.tr();
    } else {
      DateTime now = DateTime.now();
      DateTime openDateTime = DateTime(
          now.year, now.month, now.day, open.hour, open.minute);
      DateTime closeDateTime = DateTime(
          now.year, now.month, now.day, close.hour, close.minute);

      if (closeDateTime.isBefore(openDateTime)) {
        // Handle the closing time transition to the next day
        closeDateTime = closeDateTime.add(Duration(days: 1));
      }

      return openDateTime.isBefore(closeDateTime)?null:'closeTimeError'.tr();
    }
  }

  static TimeOfDay parseTimeString(String timeString) {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);

  }

 static bool isCloseTimeValid(TimeOfDay openTime, TimeOfDay closeTime) {
    if (closeTime.hour > openTime.hour) {
      return true;
    } else if (closeTime.hour == openTime.hour && closeTime.minute > openTime.minute) {
      return true;
    } else {
      return false;
    }
  }



}
