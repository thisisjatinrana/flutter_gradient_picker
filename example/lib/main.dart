import 'package:flutter/material.dart';
import 'package:flutter_gradient_picker/flutter_gradient_picker.dart';

void main() {
  runApp(const GradientPickerExampleApp());
}

class GradientPickerExampleApp extends StatelessWidget {
  const GradientPickerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient Picker Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const GradientPickerScreen(),
    );
  }
}

class GradientPickerScreen extends StatefulWidget {
  const GradientPickerScreen({super.key});

  @override
  State<GradientPickerScreen> createState() => _GradientPickerScreenState();
}

class _GradientPickerScreenState extends State<GradientPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gradient Picker Demo'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: FlutterGradientPicker(
              onGradientChanged: (gradient) {},
            ),
          ),
        ));
  }
}
