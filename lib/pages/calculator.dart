import 'package:flutter/material.dart';
import 'package:gd13_unittesting_1239/pages/calculator_ui.dart';

class CalculatorApp extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) => Calculator(
              scaffoldMessengerKey: _scaffoldMessengerKey,
            ),
          ),
        );
      },
      scaffoldMessengerKey: _scaffoldMessengerKey,
    );
  }
}

class Calculator extends StatefulWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const Calculator({Key? key, required this.scaffoldMessengerKey})
      : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSuccessLogin();
    });
  }

  void showSuccessLogin() {
    widget.scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text('Login Success'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
      ),
      body: CalculatorUI(
        firstNumberController: _firstNumberController,
        secondNumberController: _secondNumberController,
        result: _result,
        onCalculate: calculate,
      ),
    );
  }

  double calculate(double angkaPertama, double angkaKedua, String operation) {
    double result;
    if (operation == 'add') {
      result = angkaPertama + angkaKedua;
    } else if (operation == 'subtract') {
      result = angkaPertama - angkaKedua;
    } else {
      result = 0;
    }

    setState(() {
      _result = result.toString();
    });

    return result;
  }
}
