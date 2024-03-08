import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _nama = "";
  String pilihanSalam = "pagi"; // harus diletakkan di sini
  String pilihanSalamOut = ""; //untuk ditampilkan

  final textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> salam = [
      const DropdownMenuItem<String>(
        value: "pagi",
        child: Text("selamat pagi"),
      ),
      const DropdownMenuItem<String>(
        value: "siang",
        child: Text("selamat siang"),
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Dropdown Button Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama',
                ),
              ),
              SizedBox(height: 20),
              DropdownButton(
                value: pilihanSalam,
                items: salam,
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      pilihanSalam = newValue;
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nama = textEditController.text;
                    pilihanSalamOut = pilihanSalam; //ambil dari state
                  });
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text(
                _nama != "" ? 'Halo $_nama selamat $pilihanSalamOut' : "",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
