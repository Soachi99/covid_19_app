extension StringExtension on String {
  String toCurrency() {
    try {
      dynamic number = this;
      number ??= 0;

      if (number.runtimeType == String) {
        number = num.parse(number ?? '0').round();
      }
      List<String> parts = number.toString().split('.');
      RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

      parts.first = parts.first.replaceAll(re, '.');

      return parts.first;
    } catch (e) {
      return this;
    }
  }

  String formatDate() {
    try {
      String number = this;
      String date = '';

      if (number.runtimeType == String) {
        date =
            '${number.substring(0, 4)}.${number.substring(4, 6)}.${number.substring(6, 8)}';
      }

      return date;
    } catch (e) {
      return this;
    }
  }
}
