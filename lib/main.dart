import 'package:booking_hotel/ContainerGetCheckIn.dart';
import 'package:booking_hotel/ContainerGetDurasi.dart';
import 'package:booking_hotel/ContainerGetkamarDanTamu.dart';
import 'package:booking_hotel/ContainerSearchHotel.dart';
import 'package:booking_hotel/ContainerTextCheckIn.dart';
import 'package:booking_hotel/ContainerTextDurasi.dart';
import 'package:booking_hotel/ContainerTextKamarDanTamu.dart';
import 'package:booking_hotel/ConteinerGetLocation.dart';
import 'package:booking_hotel/ContainerTeksTujuan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('id')],
      title: 'Booking Hotel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pesan Hotelmu Sekarang'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  // final String? restorationId;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int lamaMenginap = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Lokasi Hotel
                    const ContainerTextLocation(),
                    const ContainerGetLocation(),

                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tanggal Check In

                          Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  ContainerTextCheckIn(),
                                  ContainerGetCheckIn(),
                                ],
                              )),

                          // Durasi
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  ContainerTextDurasi(),
                                  ContainerGetDurasi(),
                                ],
                              )),
                        ],
                      ),
                    ),

                    const ContainerTextKamarDanTamu(),
                    const ContainerGetkamarDanTamu(),
                    const ContainerSearchHotel(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
