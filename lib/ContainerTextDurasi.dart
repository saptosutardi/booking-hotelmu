import 'package:flutter/material.dart';

class ContainerTextDurasi extends StatefulWidget {
  const ContainerTextDurasi({super.key});

  @override
  State<ContainerTextDurasi> createState() => _ContainerTextDurasiState();
}

class _ContainerTextDurasiState extends State<ContainerTextDurasi> {
  @override
  Widget build(BuildContext context) {
    return const Text("Durasi", style: TextStyle(color: Colors.black54));
  }
}
