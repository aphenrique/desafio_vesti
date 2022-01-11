import 'package:flutter/material.dart';

/// Possibly a setState solve this reactivity, 
/// but this class give to app scalability
class ColorValue extends ValueNotifier<String> {
  ColorValue() : super("black");

  
}
