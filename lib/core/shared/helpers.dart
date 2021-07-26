import 'package:intl/intl.dart';

class Helpers {
  static final _formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

  static String formatTotalInvested(int total) {
    return _formatter.format(total);
  }

  static String formatProfitability(String profitability) {
    var profitabilityLength = profitability.trim().length;
    profitability = profitability.replaceAll('.', ',');

    switch (profitabilityLength) {
      case 0:
        return '';
      case 1:
        return '$profitability,000%';
      case 2:
        return '${profitability.substring(0, 1)},${profitability.substring(1)}00%';
      case 3:
        return '${profitability.substring(0, 3)}00%';
      case 4:
        return '${profitability.substring(0, 4)}00%';
      default:
        return '${profitability.substring(0, 5)}%';
    }
  }

  static String formatCDI(String cdi) {
    var cdiLength = cdi.trim().length;
    cdi = cdi.replaceAll('.', ',');

    switch (cdiLength) {
      case 0:
        return '';
      case 1:
        return '$cdi,00%';
      case 2:
        return '${cdi.substring(0, 1)},${cdi.substring(1)}0%';
      default:
        return '${cdi.substring(0, 1)},${cdi.substring(1, 3)}%';
    }
  }

  static String formatGain(String total) {
    return 'R\$ ${(total).toString().replaceAll('.', ',')}';
  }
}
