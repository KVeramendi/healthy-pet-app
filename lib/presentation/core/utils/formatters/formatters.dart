import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Formatters {
  static String? fullNameFormat(String? value) {
    if (value == null || value.isEmpty) return null;
    List<String> words = value.trim().split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    return words.join(' ');
  }

  static String? dateFormat(DateTime? date, {String pattern = 'dd/MM/yyyy'}) {
    if (date == null) return null;
    DateFormat format = DateFormat(pattern);
    return format.format(date);
  }

  static Map<String, dynamic> mapFormat(
    FormData? formData, {
    String pattern = 'dd/MM/yyyy',
  }) {
    Map<String, dynamic> map = {};
    if (formData == null) return map;
    for (final field in formData.fields) {
      map[field.key] = field.value;
    }
    return map;
  }
}
