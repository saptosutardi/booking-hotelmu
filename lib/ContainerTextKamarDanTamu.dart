import 'package:flutter/material.dart';

class ContainerTextKamarDanTamu extends StatefulWidget {
  const ContainerTextKamarDanTamu({super.key});

  @override
  State<ContainerTextKamarDanTamu> createState() =>
      _ContainerTextKamarDanTamuState();
}

class _ContainerTextKamarDanTamuState extends State<ContainerTextKamarDanTamu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child:
          const Text('Kamar & Tamu', style: TextStyle(color: Colors.black54)),
    );
  }
}
