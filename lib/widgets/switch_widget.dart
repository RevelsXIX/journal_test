import 'package:flutter/material.dart';
import 'package:journal_test/models/custom_themes.dart';

class CustomSwitch extends StatefulWidget {

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {

    return Switch.adaptive(
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
    );
  }
}