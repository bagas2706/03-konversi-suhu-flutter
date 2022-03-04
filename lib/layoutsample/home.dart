import 'package:flutter/material.dart';
import 'package:konversi_suhu/widgetsample/celcius_fahrenheit.dart';
import 'package:konversi_suhu/widgetsample/identity.dart';
import 'package:konversi_suhu/widgetsample/input.dart';
import 'package:konversi_suhu/widgetsample/kelvin_reamur.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputUser = TextEditingController();

  double _celcius = 0;
  double _fahrenheit = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void temperatureConversion() {
    setState(() {
      _celcius = double.parse(_inputUser.text);
      _fahrenheit = (_celcius * (9 / 5)) + 32;
      _reamur = (4 / 5) * _celcius;
      _kelvin = _celcius + 273.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu - Bagas Prambudi (2031710108)'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IdentityWidget(),
            InputWidget(inputUser: _inputUser),
            ResultCelciusFahrenheit(celcius: _celcius, fahrenheit: _fahrenheit),
            ResultKelvinReamur(kelvin: _kelvin, reamur: _reamur),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  temperatureConversion();
                },
                child: const Text(
                  'Konversi Suhu - Bagas Prambudi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
