import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorUI extends StatelessWidget {
  final TextEditingController firstNumberController;
  final TextEditingController secondNumberController;
  final String result;
  final Function(double, double, String) onCalculate;

  const CalculatorUI({
    Key? key,
    required this.firstNumberController,
    required this.secondNumberController,
    required this.result,
    required this.onCalculate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[800],
                ),
                child: Column(
                  children: <Widget>[
                    _buildTextField('Angka Pertama', firstNumberController),
                    const SizedBox(height: 20.0),
                    _buildTextField('Angka Kedua', secondNumberController),
                    const SizedBox(height: 20.0),
                    _buildButtons(),
                    const SizedBox(height: 20.0),
                    Text(
                      'Hasil: $result',
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: const TextStyle(fontSize: 24.0, color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () => onCalculate(
                double.tryParse(firstNumberController.text) ?? 0,
                double.tryParse(secondNumberController.text) ?? 0,
                'add'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: const Text(
              'Tambah',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () => onCalculate(
                double.tryParse(firstNumberController.text) ?? 0,
                double.tryParse(secondNumberController.text) ?? 0,
                'subtract'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: const Text(
              'Kurang',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ],
    );
  }
}
