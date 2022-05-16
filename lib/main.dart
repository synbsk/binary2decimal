import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binary 2 Decimal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Simple Binary to Decimal Value Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic decimal = 0;
  dynamic weight = 1;
  dynamic binary = 1001;
  dynamic remainder;

  dynamic _returnDecimal() {
    while (binary != 0) {
      remainder = binary % 10;
      decimal = decimal + remainder * weight;
      binary = binary / 10;
      weight = weight * 2;
    }
    print(_returnDecimal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '1001 Converted to Decimal is:',
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-1]+'),
                  )
                ],
              ),
            ),
            // Text(
            //   '$_returnDecimal',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _returnDecimal,
        tooltip: 'Convert',
        child: const Icon(Icons.adjust_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
