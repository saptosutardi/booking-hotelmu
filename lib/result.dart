import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mataram"),
        bottom: PreferredSize(
          preferredSize: const Size(0, 20),
          child: Container(
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
          ),
        ),
      ),
      body: const MyStatelessWidget(),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.namaHotel,
    required this.pembatalanGratis,
    required this.harga,
    required this.fasilitas,
    required this.sisaKamar,
  });

  final String namaHotel;
  final String pembatalanGratis;
  final String harga;
  final String fasilitas;
  final String sisaKamar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                namaHotel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                pembatalanGratis,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.black54,
                ),
              ),
              Text(
                fasilitas,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'IDR $harga',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'IDR $sisaKamar',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.foto,
    required this.namaHotel,
    required this.pembatalanGratis,
    required this.fasilitas,
    required this.harga,
    required this.sisaKamar,
  });

  final Widget foto;
  final String namaHotel;
  final String pembatalanGratis;
  final String fasilitas;
  final String harga;
  final String sisaKamar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: foto,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: _ArticleDescription(
                  namaHotel: namaHotel,
                  pembatalanGratis: pembatalanGratis,
                  fasilitas: fasilitas,
                  harga: harga,
                  sisaKamar: sisaKamar,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: const <Widget>[
        Card(
            child: CustomListItemTwo(
          foto: Image(image: AssetImage('pic_grand_legi.jpg')),
          namaHotel: 'Grand Legi Hotel',
          pembatalanGratis: 'Pembatalan gratis ',
          fasilitas: 'kolam renang | WiFi',
          harga: '390.000',
          sisaKamar: 'Sisa 5 kamar',
        )),
        Card(
            child: CustomListItemTwo(
          foto: Image(image: AssetImage('pic_grand_legi.jpg')),
          namaHotel: 'Grand Legi Hotel',
          pembatalanGratis: 'Pembatalan gratis ',
          fasilitas: 'kolam renang | WiFi',
          harga: '390.000',
          sisaKamar: 'Sisa 5 kamar',
        )),
      ],
    );
  }
}
