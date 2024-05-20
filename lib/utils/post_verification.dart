String verificationPost(String title, String content) {
  if (title.isEmpty && content.isEmpty) {
    return 'Veuillez remplir tous les champs';
  }
  if (title.length < 3) {
    return 'Le titre doit contenir au moins 3 caractères';
  }
  return '';
}