library flutter_gradient_picker;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

/// A customizable widget that allows users to pick a linear gradient
/// by selecting start and end colors, and adjusting the angle.
class FlutterGradientPicker extends StatefulWidget {
  final Function(LinearGradient) onGradientChanged;

  const FlutterGradientPicker({super.key, required this.onGradientChanged});

  @override
  State<FlutterGradientPicker> createState() => _FlutterGradientPickerState();
}

class _FlutterGradientPickerState extends State<FlutterGradientPicker> {
  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;
  double _angle = 90.0;

  void _updateGradient() {
    final radians = _angle * pi / 180;
    final begin = Alignment(cos(radians), sin(radians));
    final end = Alignment(-cos(radians), -sin(radians));

    widget.onGradientChanged(
      LinearGradient(colors: [_startColor, _endColor], begin: begin, end: end),
    );
  }

  void _pickColor(
      String title,
      Color currentColor,
      ValueChanged<Color> onColorChanged,
      ) {
    Color tempColor = currentColor;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: tempColor,
            onColorChanged: (color) => tempColor = color,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              onColorChanged(tempColor);
              Navigator.of(context).pop();
              _updateGradient();
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSelector(String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF29292A),
        ),
        child: Row(
          children: [
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
            const Spacer(),
            Text(
              '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
            ),
            const SizedBox(width: 10),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final previewGradient = LinearGradient(
      colors: [_startColor, _endColor],
      begin: Alignment(cos(_angle * pi / 180), sin(_angle * pi / 180)),
      end: Alignment(-cos(_angle * pi / 180), -sin(_angle * pi / 180)),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionContainer(
            title: "PREVIEW",
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: previewGradient,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildSectionContainer(
            title: "COLORS",
            child: Column(
              children: [
                _buildColorSelector("Start Color", _startColor, () {
                  _pickColor("Start Color", _startColor,
                          (color) => setState(() => _startColor = color));
                }),
                const SizedBox(height: 10),
                _buildColorSelector("End Color", _endColor, () {
                  _pickColor("End Color", _endColor,
                          (color) => setState(() => _endColor = color));
                }),
                const Divider(height: 30, color: Colors.grey),
                const Text(
                  "ANGLE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.green,
                    inactiveTrackColor: Colors.grey[300],
                    thumbColor: Colors.green,
                    overlayColor: Colors.green.withOpacity(0.2),
                    trackHeight: 4.0,
                  ),
                  child: Slider(
                    value: _angle,
                    min: 0,
                    max: 360,
                    divisions: 36,
                    label: "${_angle.round()}°",
                    onChanged: (value) {
                      setState(() => _angle = value);
                      _updateGradient();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
