import 'package:flutter_test/flutter_test.dart';
import 'package:gd13_unittesting_1239/pages/calculator.dart';

void main() {
  testWidgets('Addition calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());
    await tester.pump();

    const angkaPertama = 5.0;
    const angkaKedua = 3.0;
    const operation = 'add';

    final CalculatorState calculatorState =
        tester.state(find.byType(Calculator));
    final result =
        calculatorState.calculate(angkaPertama, angkaKedua, operation);

    expect(result, 8.0);
  });

  testWidgets('subtraction calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());
    await tester.pump();

    const angkaPertama = 5.0;
    const angkaKedua = 3.0;
    const operation = 'subtract';

    final CalculatorState calculatorState =
        tester.state(find.byType(Calculator));
    final result =
        calculatorState.calculate(angkaPertama, angkaKedua, operation);

    expect(result, 2.0);
  });

  testWidgets('error handling calculation test', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());
    await tester.pump();

    const angkaPertama = 5.0;
    const angkaKedua = 3.0;
    const operation = 'invalid';

    final CalculatorState calculatorState =
        tester.state(find.byType(Calculator));
    final result =
        calculatorState.calculate(angkaPertama, angkaKedua, operation);

    expect(result, 0);
  });
}
