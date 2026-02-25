import 'dart:io';

void main() {
  UnitConverterApp().run();
}

class UnitConverterApp {
  final Map<String, Map<String, double>> _unitCategories = {
    'length': {
      'meter': 1,
      'kilometer': 1000,
      'centimeter': 0.01,
      'millimeter': 0.001,
      'mile': 1609.34,
    },
    'mass': {
      'gram': 1,
      'kilogram': 1000,
      'milligram': 0.001,
      'ton': 1000000,
      'pound': 453.592,
    },
    'volume': {
      'liter': 1,
      'milliliter': 0.001,
      'cubic_meter': 1000,
      'gallon': 3.78541,
      'cup': 0.24,
    }
  };

  void run() {
    print('=== KATEGORI KONVERSI ===');
    print('Kategori tersedia: ${_unitCategories.keys.join(', ')}, temperature');

    final category = _readString('Pilih kategori: ');

    if (category == 'temperature') {
      _convertTemperature();
      return;
    }

    if (!_unitCategories.containsKey(category)) {
      print('Kategori tidak valid');
      return;
    }

    final units = _unitCategories[category]!;

    print('Unit tersedia: ${units.keys.join(', ')}');

    final from = _readString('Dari: ');
    final to = _readString('Ke: ');
    final value = _readDouble('Nilai: ');

    if ((category == 'mass' || category == 'volume') && value < 0) {
      print('Nilai tidak boleh negatif');
      return;
    }

    if (!units.containsKey(from) || !units.containsKey(to)) {
      print('Unit tidak valid');
      return;
    }

    final result = _convert(units, from, to, value);

    print('\n=== HASIL KONVERSI ===');
    print('$value $from = ${_formatResult(result)} $to');
  }

  double _convert(Map<String, double> units, String from, String to, double value) {
    final baseValue = value * units[from]!;
    return baseValue / units[to]!;
  }

  void _convertTemperature() {
    print('Unit suhu: celsius, fahrenheit, kelvin');

    final from = _readString('Dari: ');
    final to = _readString('Ke: ');
    final value = _readDouble('Nilai: ');

    double result;

    if (from == 'celsius' && to == 'fahrenheit') {
      result = (value * 9 / 5) + 32;
    } else if (from == 'fahrenheit' && to == 'celsius') {
      result = (value - 32) * 5 / 9;
    } else if (from == 'celsius' && to == 'kelvin') {
      result = value + 273.15;
    } else if (from == 'kelvin' && to == 'celsius') {
      result = value - 273.15;
    } else {
      result = value;
    }

    print('\n=== HASIL KONVERSI ===');
    print('$value $from = ${_formatResult(result)} $to');
  }

  String _formatResult(double value) {
    final formatted = value.toStringAsFixed(4);
    return formatted
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  }

  String _readString(String label) {
    stdout.write(label);
    return stdin.readLineSync()!.toLowerCase();
  }

  double _readDouble(String label) {
    stdout.write(label);
    return double.parse(stdin.readLineSync()!);
  }
}