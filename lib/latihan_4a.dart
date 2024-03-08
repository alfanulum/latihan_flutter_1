import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InputMahasiswa(),
    );
  }
}

class InputMahasiswa extends StatefulWidget {
  @override
  _InputMahasiswaState createState() => _InputMahasiswaState();
}

class _InputMahasiswaState extends State<InputMahasiswa> {
  String _nama = '';
  String _gender = '';
  bool _sudahBekerja = false;
  double _tinggiBadan = 160;
  List<String> _makananFavorit = [];
  String _pekerjaanOrtu = 'PNS'; // Perubahan nilai awal
  String _provinsiAsal = 'Jawa Timur'; // Perubahan nilai awal

  final List<String> _jenisKelamin = ['Laki-laki', 'Perempuan'];
  final List<String> _daftarMakanan = [
    'Nasi Goreng',
    'Mie Ayam',
    'Bakso',
    'Sate',
    'Martabak'
  ];
  final List<String> _pekerjaanOrangTua = [
    'PNS',
    'Wiraswasta',
    'Petani',
    'Buruh',
    'Lainnya'
  ];
  final List<String> _daftarProvinsi = [
    'Jawa Timur',
    'Jawa Barat',
    'Jawa Tengah',
    'DKI Jakarta',
    'Banten'
  ];

  void _submitForm() {
    // Implementasi aksi yang akan dilakukan ketika data mahasiswa disubmit
    // Anda bisa menambahkan logika penyimpanan data di sini
    print('Nama: $_nama');
    print('Jenis Kelamin: $_gender');
    print('Sudah Bekerja: $_sudahBekerja');
    print('Tinggi Badan: $_tinggiBadan');
    print('Makanan Favorit: $_makananFavorit');
    print('Pekerjaan Orang Tua: $_pekerjaanOrtu');
    print('Provinsi Asal: $_provinsiAsal');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama'),
              onChanged: (value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Jenis Kelamin'),
            Column(
              children: _jenisKelamin.map((jenis) {
                return RadioListTile(
                  title: Text(jenis),
                  value: jenis,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sudah Bekerja?'),
                Switch(
                  value: _sudahBekerja,
                  onChanged: (value) {
                    setState(() {
                      _sudahBekerja = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tinggi Badan'),
                Text('${_tinggiBadan.toStringAsFixed(0)} cm'),
              ],
            ),
            Slider(
              min: 100,
              max: 200,
              divisions: 100,
              value: _tinggiBadan,
              onChanged: (value) {
                setState(() {
                  _tinggiBadan = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Makanan Favorit'),
            Column(
              children: _daftarMakanan.map((makanan) {
                return CheckboxListTile(
                  title: Text(makanan),
                  value: _makananFavorit.contains(makanan),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!)
                        _makananFavorit.add(makanan);
                      else
                        _makananFavorit.remove(makanan);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Pekerjaan Orang Tua'),
              value: _pekerjaanOrtu,
              items: _pekerjaanOrangTua.map((pekerjaan) {
                return DropdownMenuItem(
                  value: pekerjaan,
                  child: Text(pekerjaan),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _pekerjaanOrtu = value.toString();
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Provinsi Asal'),
              value: _provinsiAsal,
              items: _daftarProvinsi.map((provinsi) {
                return DropdownMenuItem(
                  value: provinsi,
                  child: Text(provinsi),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _provinsiAsal = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
