import 'package:intl/intl.dart';

String prettyDateTime(DateTime value) {
  value = value.toLocal();
  final formatter = DateFormat('dd/MM - HH:mm');
  return formatter.format(value);
}

String prettyDate(DateTime value) {
  value = value.toLocal();
  final DateFormat formatter = DateFormat('dd/MM/y');
  return formatter.format(value);
}
