import 'package:esp_dashboard/presentation/widgets/atoms/input_field.dart';
import 'package:flutter/material.dart';
// import '../widgets/atoms/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyInputField(
            color: Colors.white,
          )
        ),
      ),
    );
  }
}
