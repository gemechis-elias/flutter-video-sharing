String formatDateTimeDifference(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);
  String differenceString = '';

  if (difference.inDays > 0) {
    differenceString = '${difference.inDays} days ago';
  } else if (difference.inHours > 0) {
    differenceString = '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    differenceString = '${difference.inMinutes} minutes ago';
  } else {
    differenceString = 'Just now';
  }

  return differenceString;
}
