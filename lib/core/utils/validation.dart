class MyValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return "Password must contain at least one uppercase letter";
    // }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one digit";
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');

    if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }
}
