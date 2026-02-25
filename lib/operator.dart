void main() {
  final app = OperatorApp();
  app.run();
}

class OperatorApp {
  void run() {
    int a = 10;
    int b = 5;

    print('\nAritmatika');
    print('a + b = ${a + b}');
    print('a - b = ${a - b}');
    print('a * b = ${a * b}');
    print('a / b = ${a / b}');
    print('a % b = ${a % b}');

    print('\nAssignment');
    a += 5;
    print('a += 5 = $a');

    print('\nComparison');
    print('a > b = ${a > b}');
    print('a == b = ${a == b}');

    print('\nLogical');
    print('a > 5 && b < 10 = ${a > 5 && b < 10}');
    print('a < 5 || b == 5 = ${a < 5 || b == 5}');

    print('\nIncrement/Decrement');
    a++;
    b--;
    print('a++ = $a');
    print('b-- = $b');

    print('\nTernary');
    String result = a > b ? 'A lebih besar' : 'B lebih besar';
    print('a > b ? "A lebih besar" : "B lebih besar" = $result');
  }
}