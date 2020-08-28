class Validators {
  //Validators
  static String validateEmail(String email) {
    if(email == null || email.isEmpty) {
      return 'Field required';
    }
    if (!isEmailValid(email)) {
      return 'Invalide e-mail';
    }
    return null;
  }

  static String validatePassword(String password) {
    if(password == null || password.isEmpty) {
      return 'Field required';
    }
    if (!isPasswordValid(password)) {
      return 'Worng password';
    }
    return null;
  }

  static String validateRequired(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field required';
    }
    return null;
  }

  //Regras
  static bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool isPasswordValid(String password) {
    bool passwordValid =
        RegExp(r"(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}").hasMatch(password);
    return passwordValid;
  }
}
