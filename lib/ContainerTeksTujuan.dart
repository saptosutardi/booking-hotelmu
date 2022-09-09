import 'package:flutter/material.dart';

class ContainerTextLocation extends StatefulWidget {
  const ContainerTextLocation({super.key});

  @override
  State<ContainerTextLocation> createState() => ContainerTextLocationState();
}

class ContainerTextLocationState extends State<ContainerTextLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: const Text(
        'Pilih Tujuan',
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
