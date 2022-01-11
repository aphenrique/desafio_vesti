import 'package:flutter/material.dart';

import 'package:desafio_vesti/features/product/view/widgets/color_value.dart';

class CustomColorRadio extends StatefulWidget {
  final ColorValue colorValue;

  const CustomColorRadio({Key? key, required this.colorValue})
      : super(key: key);

  @override
  _CustomColorRadioState createState() => _CustomColorRadioState();
}

class _CustomColorRadioState extends State<CustomColorRadio> {
  String color = "black";

  final Map<String, Color> _colorsMock = {
    "black": Colors.black,
    "pink": Colors.pink.shade400,
    "yellow": Colors.yellow.shade700,
    "teal": Colors.teal.shade400,
  };

  late Map<String, Color> colors;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: widget.colorValue,
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: _colorsMock.entries
              .map(
                (e) => Radio(
                  fillColor: MaterialStateProperty.all<Color>(e.value),
                  visualDensity: VisualDensity.comfortable,
                  activeColor: Colors.blue,
                  value: e.key,
                  groupValue: value,
                  onChanged: (color) {
                    widget.colorValue.value = color.toString();
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
