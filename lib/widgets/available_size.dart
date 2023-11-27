import 'package:flutter/material.dart';

class Availablesize extends StatefulWidget {
  const Availablesize({super.key});

  @override
  State<Availablesize> createState() => _AvailablesizeState();
}

class _AvailablesizeState extends State<Availablesize> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      width: 40,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.blue)),
    );
  }
}
