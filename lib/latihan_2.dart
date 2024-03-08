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
        scaffoldBackgroundColor: Colors.white,
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
    double panjang = double.tryParse(_panjangController.text) ?? 0;
    double lebar = double.tryParse(_lebarController.text) ?? 0;

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
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF64B5F6),
              Color(0xFF1976D2),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _panjangController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lebarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Lebar',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _hitungLuasDanKeliling,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF1976D2)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 16)),
                ),
                child: Text('Hitung', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Luas: $_luas',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Keliling: $_keliling',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
