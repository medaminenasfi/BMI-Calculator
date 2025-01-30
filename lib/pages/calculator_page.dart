import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _res = "";
  String _selected_gendar = 'mal';
  DateTime _selected_date = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  void _calculate() {
    double w = double.parse(_weightController.text);
    double h = double.parse(_heightController.text) / 100;
    double bml = w / (h * h);
    String g = _selected_gendar;
    setState(() {
      _res = "Your BMI is ${bml.toStringAsFixed(2)}\nYour gender is ${g}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.account_circle),
                labelText: "Gender",
                hintText: "Select Your Gender",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: const [
                DropdownMenuItem(child: Text("Male"), value: 'mal'),
                DropdownMenuItem(child: Text("Female"), value: 'Fem'),
              ],
              onChanged: (value) {
                setState(() {
                  _selected_gendar = value!;
                });
              },
            ),
            const SizedBox(height: 50),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is empty';
                }
                return null;
              },
              controller: _weightController,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                hintText: "Enter Your Weight",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is empty';
                }
                return null;
              },
              controller: _heightController,
              decoration: InputDecoration(
                labelText: "Height (cm)",
                hintText: "Enter Your Height",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 50),
            DateTimeFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.date_range),
                labelText: "Date of Birth",
                hintText: "Select Your Date of Birth",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (DateTime? value) {
                setState(() {
                  _selected_date = value!;
                });
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _calculate();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields are valid!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields!")),
                  );
                }
              },
              child: const Text("Calculate"),
            ),
            Text(_res),
          ],
        ),
      ),
    );
  }
}
