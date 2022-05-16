import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  TextEditingController _binaryController = TextEditingController();

  void _returnDecimal() {
    num decimal = 0;
    num weight = 1;
    num binary = num.parse(_binaryController.text);
    num remainder;
    print('Binary Value Transferred ${binary}');
    while (binary != 0) {
      remainder = binary % 10;
      decimal = decimal + remainder * weight;
      weight = weight * 2;
      binary = binary / 10;
    }
    print('Decimal Value is ${binary}');
    // print('Decimal Value is ${_binaryController.text}');
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
