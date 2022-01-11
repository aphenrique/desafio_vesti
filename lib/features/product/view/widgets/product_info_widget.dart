import 'package:flutter/material.dart';

class ProductInfoWidget extends StatefulWidget {
  final String subtitle;
  final Widget content;

  const ProductInfoWidget({
    Key? key,
    required this.subtitle,
    required this.content,
  }) : super(key: key);

  @override
  _ProductInfoWidgetState createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  final TextStyle _subtitleStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              widget.subtitle,
              style: _subtitleStyle,
            ),
          ),
          Expanded(
            flex: 6,
            child: widget.content,
          ),
        ],
      ),
    );
  }
}
