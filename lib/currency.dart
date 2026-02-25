import 'dart:io';

void main() {
  final app = CurrencyApp();
  app.run();
}

class CurrencyApp {
  final Map<String, double> rates = {
    'USD': 1.0,
    'IDR': 15000.0,
    'EUR': 0.90,
  };

  void run() {
    print('Mata uang tersedia: ${rates.keys.join(', ')}');

    stdout.write('Dari: ');
    final from = stdin.readLineSync()!.toUpperCase();

    stdout.write('Ke: ');
    final to = stdin.readLineSync()!.toUpperCase();

    stdout.write('Jumlah: ');
    final amount = double.parse(stdin.readLineSync()!);

    final result = convert(from, to, amount);

    print('\nHasil: ${result.toStringAsFixed(2)} $to');
  }

  double convert(String from, String to, double amount) {
    if (!rates.containsKey(from) || !rates.containsKey(to)) {
      throw Exception('Mata uang tidak valid');
    }

    final baseAmount = amount / rates[from]!;
    return baseAmount * rates[to]!;
  }
}