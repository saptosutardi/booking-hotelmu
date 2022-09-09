import 'package:flutter/material.dart';

class ContainerTextCheckIn extends StatefulWidget {
  const ContainerTextCheckIn({super.key});

  @override
  State<ContainerTextCheckIn> createState() => _ContainerTextCheckInState();
}

class _ContainerTextCheckInState extends State<ContainerTextCheckIn> {
  @override
  Widget build(BuildContext context) {
    return Text("Check In",
        textAlign: TextAlign.start, style: TextStyle(color: Colors.black54));
  }
}
