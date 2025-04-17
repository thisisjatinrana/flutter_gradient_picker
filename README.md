# 🌈 flutter_gradient_picker

A beautiful, interactive, and customizable gradient picker widget for Flutter. Allows users to select start and end colors and adjust the gradient angle visually and easily.

![Pub Version](https://img.shields.io/pub/v/flutter_gradient_picker.svg)
![Platform](https://img.shields.io/pub/platform/flutter_gradient_picker)
![License](https://img.shields.io/github/license/yourusername/flutter_gradient_picker)

![Android](https://img.shields.io/badge/platform-Android-green.svg)
![iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![Web](https://img.shields.io/badge/platform-Web-purple.svg)
![macOS](https://img.shields.io/badge/platform-macOS-grey.svg)
![Windows](https://img.shields.io/badge/platform-Windows-lightblue.svg)
![Linux](https://img.shields.io/badge/platform-Linux-yellow.svg)


## ✨ Features

- Live gradient preview
- Color pickers for start and end colors
- Slider to control gradient angle (0°–360°)
- Fully customizable UI
- Dark-themed styling

---

## 📦 Installation

Add this to your `pubspec.yaml`:

dependencies:
  flutter_gradient_picker: ^1.0.0

Install it:
flutter pub get


## 🚀 Usage

import 'package:flutter/material.dart';
import 'package:flutter_gradient_picker/flutter_gradient_picker.dart';

class GradientDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Gradient Picker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FlutterGradientPicker(
          onGradientChanged: (LinearGradient gradient) {
            // Use the gradient however you want
            print('Gradient updated: $gradient');
          },
        ),
      ),
    );
  }
}

## 📂 Example
A complete usage example is available in the example/ folder.

## 🙌 Credits
Built with ❤️ using Flutter and flutter_colorpicker
