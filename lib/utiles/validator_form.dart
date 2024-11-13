class ValidatorUser {
  static String? ValidedatorName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }

    return null;
  }

  static String? ValidedatorEmail(String? value) {
    var emailReg = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (value == null || value.isEmpty) {
      return "email is required";
    }
    if (!emailReg.hasMatch(value)) {
      return "invalid email";
    }
    return null;
  }

  static String? ValidedatorPassWord(String? value) {
    if (value == null || value.isEmpty) {
      return "password is required";
    }

    if (value.length < 6) {
      return "password must be at least 6 charcaters";
    }
    return null;
  }

  static String? ValidedatorNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Number is required";
    }

    var phoneRegex = RegExp(r'^\d+$');
    if (!phoneRegex.hasMatch(value)) {
      return "Only number is accepted";
    }

    return null;
  }
}
