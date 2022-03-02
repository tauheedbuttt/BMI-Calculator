import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/output_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1D2136)),
        scaffoldBackgroundColor: Color(0xFF1D2136),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/output': (context) => OutputPage(),
      },
    );
  }
}
