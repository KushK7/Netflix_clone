import 'package:flutter/material.dart';

void main(){
   runApp(BMICalculator());
}


class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _height = 160.0;
  double _weight = 60.0;
  double _bmi = 0.0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Height (cm)'),
            Slider(
              value: _height,
              min: 120.0,
              max: 220.0,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            Text(_height.toStringAsFixed(1)),
            SizedBox(height: 16.0),
            Text('Weight (kg)'),
            Slider(
              value: _weight,
              min: 40.0,
              max: 150.0,
              onChanged: (value) {
                setState(() {
                  _weight = value;
                });
              },
            ),
            Text(_weight.toStringAsFixed(1)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            Text(
              'BMI: ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}