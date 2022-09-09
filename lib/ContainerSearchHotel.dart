import 'package:flutter/material.dart';
import 'package:booking_hotel/result.dart';

class ContainerSearchHotel extends StatefulWidget {
  const ContainerSearchHotel({super.key});

  @override
  State<ContainerSearchHotel> createState() => _ContainerSearchHotelState();
}

class _ContainerSearchHotelState extends State<ContainerSearchHotel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Result()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[900],
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child:
                    const Text('CARI HOTEL', style: TextStyle(fontSize: 15)))));
  }
}
