String formatDate(String date) {
  DateTime postDate = DateTime.parse(date);
  return '${postDate.day}/${postDate.month}/${postDate.year} - ${postDate.hour}:${postDate.minute}';
}
