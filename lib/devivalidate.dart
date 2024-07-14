class DeviValidate {
  /// Validates if the given [email] is in a proper email format.
  ///
  /// Returns `true` if the [email] is valid, otherwise `false`.
  bool isEmail(String email) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    ).hasMatch(email);
    return emailValid;
  }

  /// Validates if the given [password] meets the required criteria.
  ///
  /// The password must be at least 8 characters long and include at least one uppercase letter,
  /// one lowercase letter, one digit, and one special character.
  /// Returns `true` if the [password] is valid, otherwise `false`.
  bool isPassword(String password) {
    String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  /// Validates if the given [url] is a properly formatted URL.
  ///
  /// Returns `true` if the [url] is valid, otherwise `false`.
  bool isUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Validates if the given [phoneNumber] is in a proper phone number format.
  ///
  /// Returns `true` if the [phoneNumber] is valid, otherwise `false`.
  bool isPhoneNumber(String phoneNumber) {
    bool phoneValid = RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber);
    return phoneValid;
  }

  /// Validates if the given [name] contains only alphabets and spaces.
  ///
  /// Returns `true` if the [name] is valid, otherwise `false`.
  bool isName(String name) {
    bool nameValid = RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);
    return nameValid;
  }

  /// Validates if the given [username] meets the required criteria.
  ///
  /// The username must be between 3 and 16 characters long and include only letters, numbers, underscores, and dots.
  /// Returns `true` if the [username] is valid, otherwise `false`.
  bool isUsername(String username) {
    bool usernameValid = RegExp(r'^[a-zA-Z0-9._]{3,16}$').hasMatch(username);
    return usernameValid;
  }
}
