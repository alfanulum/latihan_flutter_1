import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persegi Panjang Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersegiPanjangCalculator(),
    );
  }
}

class PersegiPanjangCalculator extends StatefulWidget {
  @override
  _PersegiPanjangCalculatorState createState() =>
      _PersegiPanjangCalculatorState();
}

class _PersegiPanjangCalculatorState extends State<PersegiPanjangCalculator> {
  TextEditingController _panjangController = TextEditingController();
  TextEditingController _lebarController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  void _hitungLuasDanKeliling() {
    double panjang = double.parse(_panjangController.text);
    double lebar = double.parse(_lebarController.text);

    double luas = panjang * lebar;
    double keliling = 2 * (panjang + lebar);

    setState(() {
      _luas = luas;
      _keliling = keliling;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persegi Panjang Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Panjang'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lebar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _hitungLuasDanKeliling,
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            Text(
              'Luas: $_luas',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Keliling: $_keliling',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
