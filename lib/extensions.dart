import 'package:webtodo/utils.dart' as u;

extension DateTimeExtension on DateTime {
  String prettyDate() {
    return u.prettyDate(this);
  }

  String prettyDateTime() {
    return u.prettyDateTime(this);
  }


}