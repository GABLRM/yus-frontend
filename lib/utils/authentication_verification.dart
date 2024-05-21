bool verificationEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool verificationPassword(String password, String confirm) {
  return password == confirm;
}

String verificationRegisteringAccount(String username, String firstname,
    String lastname, String email, String password, String confirm) {
  if (username.isEmpty &&
      firstname.isEmpty &&
      lastname.isEmpty &&
      email.isEmpty &&
      password.isEmpty &&
      confirm.isEmpty) {
    return 'Veuillez remplir tous les champs';
  }
  if (!verificationEmail(email)) {
    return 'Adresse mail invalide';
  }
  if (!verificationPassword(password, confirm)) {
    return 'Les mots de passe ne correspondent pas';
  }
  if (password.length < 8) {
    return 'Le mot de passe doit contenir au moins 8 caractères';
  }
  return '';
}

String verificationLoginAccount(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    return 'Veuillez remplir tous les champs';
  }
  if (!verificationEmail(email)) {
    return 'Adresse mail invalide';
  }
  return '';
}
