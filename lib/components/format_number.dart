
import 'package:intl/intl.dart';

class FormatNumber {
  static numberFormat(price) {
    var f = NumberFormat('###,###', 'en_US');
    return f.format(price);
  }
}
