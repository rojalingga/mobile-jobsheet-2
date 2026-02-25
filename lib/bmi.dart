import 'dart:io';
import 'dart:math';

void main() {
  final app = BmiApp();
  app.run();
}

class BmiApp {
  void run() {
    final weight = _readDouble('Masukkan berat badan (kg): ');
    final heightCm = _readDouble('Masukkan tinggi badan (cm): ');

    final bmi = _calculateBmi(weight, heightCm);
    final category = _bmiCategory(bmi);

    print('\nHasil BMI Anda: ${bmi.toStringAsFixed(2)}');
    print('Kategori: $category');
  }

  double _readDouble(String label) {
    stdout.write(label);
    return double.parse(stdin.readLineSync()!);
  }

  double _calculateBmi(double weight, double heightCm) {
    final heightM = heightCm / 100;
    return weight / pow(heightM, 2);
  }

  String _bmiCategory(double bmi) {
    if (bmi < 18.5) return 'Kurus';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obesitas';
  }
}