class FormsUtils {
  bool isEmailValid(String email) {
    // Define a regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    // Define your password criteria here
    // For example, let's require a minimum length of 8 characters
    if (password.length < 6) {
      return false;
    }
    return true;
  }
}
