// import 'package:flutter/material.dart';
// import 'package:untitled2/caculator/colors.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: CaApp(),
//   ));
// }
//
// class CaApp extends StatefulWidget {
//   const CaApp({super.key});
//
//   @override
//   State<CaApp> createState() => _CaAppState();
// }
//
// class _CaAppState extends State<CaApp> {
//   dynamic a="1";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//               child: Container(
//             color: Colors.yellow,
//           )),
//           Row(
//             children: [button(a="A"), button(a="B"), button(a="C"), button(a="/")],),
//           Row(
//             children: [button(a="7"), button(a="8"), button(a="9"), button(a="*")],),
//           Row(
//             children: [button(a="4"), button(a="5"), button(a="6"), button(a="--")],),
//           Row(
//             children: [button(a="1"), button(a="2"), button(a="3"), button(a="+")],),
//           Row(
//             children: [button(a="0"), button(a=","), button(a="XOA"), button(a="=")],),
//
//
//         ],
//       ),
//     );
//   }
//
//   Widget button(String a) {
//
//     return Expanded(
//         child: Container(
//       margin: EdgeInsets.all(8),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             primary: buttonColor,
//             padding: EdgeInsets.all(22)),
//         onPressed: () {},
//         child: Text(
//           a,
//           style: TextStyle(
//               fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorState(),
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellow,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Consumer<CalculatorState>(
                builder: (context, calculatorState, child) {
                  return Text(
                    calculatorState.currentValue,
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
            ),
          ),
          for (var row in buttonRows)
            CalculatorRow(
              row.map((buttonText) => CalculatorButton(text: buttonText)).toList(),
            ),
        ],
      ),
    );
  }

  final List<List<String>> buttonRows = [
    ['7', '8', '9', '/'],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['C', '0', '=', '+'],
  ];
}

class CalculatorRow extends StatelessWidget {
  final List<Widget> buttons;

  const CalculatorRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;

  CalculatorButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(context),
          child: Text(text),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    final CalculatorState calculatorState = context.read<CalculatorState>();
    if (text == 'C') {
      calculatorState.clear();
    } else if (text == '=') {
      calculatorState.calculateResult();
    } else if (text == '+' || text == '-' || text == '*' || text == '/') {
      calculatorState.setOperator(text);
    } else {
      calculatorState.appendValue(text);
    }
  }
}

