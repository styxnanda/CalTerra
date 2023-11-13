import 'package:calterra/viewModel/view_login.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PhysicalShape Sample'),
        ),
        body: const Center(child: PhysicalShapeExample()),
      ),
    );
  }
}

class PhysicalShapeExample extends StatelessWidget {
  const PhysicalShapeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewLogin(),
      builder: (context, model, child) => const Scaffold(
        body: SizedBox(
          height: 200.0,
          width: 200.0,
          child: Center(
            child: Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
