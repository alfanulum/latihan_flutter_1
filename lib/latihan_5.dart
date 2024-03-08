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
  String _pekerjaanOrtu = 'PNS';
  String _provinsiAsal = 'Jawa Timur';

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
    // Validasi nama dan provinsi tidak kosong
    if (_nama.isEmpty || _provinsiAsal.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Nama dan Provinsi Asal tidak boleh kosong!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah data sudah benar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _saveData();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _saveData() {
    // Simulasi penyimpanan data
    // Di sini Anda dapat menambahkan logika penyimpanan data sesungguhnya
    // Misalnya, menyimpan data ke database atau mengirimnya ke server

    // Tampilkan Snackbar "Data berhasil disimpan"
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data berhasil disimpan'),
      ),
    );

    // Bersihkan formulir setelah data disimpan
    _clearForm();
  }

  void _clearForm() {
    setState(() {
      _nama = '';
      _gender = '';
      _sudahBekerja = false;
      _tinggiBadan = 160;
      _makananFavorit = [];
      _pekerjaanOrtu = 'PNS';
      _provinsiAsal = 'Jawa Timur';
    });
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
