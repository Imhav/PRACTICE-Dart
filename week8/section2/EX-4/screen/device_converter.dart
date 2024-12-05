import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Device { euro, riel, dong }

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _valueController = TextEditingController();
  Device? _selectedDevice;
  double _result = 0;

  void _convertCurrency() {
    setState(() {
      if (_valueController.text.isEmpty) {
        _result = 0;
        return;
      }
      double currency = double.parse(_valueController.text);
      switch (_selectedDevice) {
        case Device.euro:
          _result = currency * 0.95;
          break;
        case Device.riel:
          _result = currency * 4000;
          break;
        case Device.dong:
          _result = currency * 25400;
          break;
        default:
          _result = 0;
      }
    });
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _valueController,
              maxLength: 20,
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          const Text("Device:"),
          DropdownButton<Device>(
              value: _selectedDevice,
              onChanged: (Device? newValue) {
                setState(() {
                  _selectedDevice = newValue!;
                  _convertCurrency();
                });
              },
              items:
                  Device.values.map<DropdownMenuItem<Device>>((Device device) {
                return DropdownMenuItem<Device>(
                  value: device,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(device.name),
                    ],
                  ),
                );
              }).toList()),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text("$_result")),
        ],
      )),
    );
  }
}
