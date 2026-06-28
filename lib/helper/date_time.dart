import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    DateTime parsedDate = DateTime.parse(dateString).toLocal();

    return DateFormat('dd/MM/yyyy, hh:mm a').format(parsedDate);
  } catch (e) {
    return dateString;
  }
}
