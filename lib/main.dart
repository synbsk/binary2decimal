import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  TextEditingController _binaryController = TextEditingController();

  void _returnDecimal() {
    num binary = num.parse(_binaryController.text);
    print('Binary Value Transferred ${binary}');
    int decimalNumber = int.parse(_binaryController.text, radix: 2);
    print('Output for Decimal is ${decimalNumber}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Binary 2 Decimal",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Binary to Decimal Converter"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Input Binary Value"),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _binaryController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-1]+'),
                      ),
                    ],
                  ),
                ),
                // new ElevatedButton(
                //   child: Text("Convert"),
                //   onPressed: _returnDecimal,
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _returnDecimal,
          tooltip: 'Convert',
          child: const Icon(Icons.adjust_sharp),
        ),
      ),
    );
  }
}
