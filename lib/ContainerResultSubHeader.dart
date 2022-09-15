import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ContainerSubHeader extends StatefulWidget {
  const ContainerSubHeader({super.key});

  @override
  State<ContainerSubHeader> createState() => _ContainerSubHeaderState();
}

class _ContainerSubHeaderState extends State<ContainerSubHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        child: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 13,
            ),
            children: [
              TextSpan(
                text: '12 Sep 22 - 14 Sep 22, 1 Malam | ',
              ),
              WidgetSpan(
                child: Icon(Icons.apartment, size: 13),
              ),
              TextSpan(
                text: '1 ',
              ),
              WidgetSpan(
                child: Icon(Icons.people, size: 13),
              ),
              TextSpan(
                text: '1',
              )
            ],
          ),
        ),
      ),
      // child: ElevatedButton(
      //   "bottom",
      //   style: const TextStyle(color: Colors.white),
      // ),
    );
  }
}
