import 'package:intl/intl.dart';

final rupiahFormatter = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp ',
  decimalDigits: 0,
);

String formatRupiah(num amount) => rupiahFormatter.format(amount);

String formatMonthLabel(String bulan) {
  try {
    final date = DateTime.parse('$bulan-01');
    return DateFormat('MMMM yyyy', 'id_ID').format(date);
  } catch (_) {
    return bulan;
  }
}
