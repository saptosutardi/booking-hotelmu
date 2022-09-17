import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'ContainerResultSubHeader.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb2;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:currency_app/currecy_format.dart';

// import 'package:firebase/firebase.dart' as fb;

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('data_hotel');

var link = "grand_legi";
var link2 = "gs://booking-hotel-5a52a.appspot.com/grand_legi.jpeg";
var link3 =
    "https://www.kayak.com/rimg/himg/11/e6/c3/expediav2-176152-297179-178242.jpg";

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    print('---> here -2');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mataram"),
        bottom: const PreferredSize(
          preferredSize: Size(0, 20),
          child: ContainerSubHeader(),
        ),
      ),
      body: /* Image(
        image: FirebaseImage(
            "gs://booking-hotel-5a52a.appspot.com/grand_legi.jpeg",
            shouldCache: true, // The image should be cached (default: True)
            maxSizeBytes: 3000 * 3000, // 3MB max file size (default: 2.5MB)
            cacheRefreshStrategy:
                CacheRefreshStrategy.NEVER // Switch off update checking
            ),
        width: 100,
      ), */

          MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('data_hotel').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        // print('---> here 1');

        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    // print('---> here 2');
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Image.network(
                      link3,
                      width: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(record.name),
                          Row(
                            children: [
                              Text(wifi(record.wifi),
                                  style: const TextStyle(
                                      fontSize: 9,
                                      color: Colors
                                          .green)), //record.wifi.toString()),
                              const Text(" | ",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: Colors
                                          .green)), //record.wifi.toString()),
                              Text(pool(record.pool),
                                  style: const TextStyle(
                                      fontSize: 9, color: Colors.green)),
                            ],
                          ),

                          // Text(reiew(record.review)),
                          RatingBarIndicator(
                            rating: record.review,
                            itemCount: 5,
                            itemSize: 10,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),

                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  Text(price(record.price),
                                      style:
                                          TextStyle(color: Colors.orange[900])),
                                  const Text("/kamar/malam",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.black54)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

                // Image(image: CachedNetworkImageProvider(link2))
                // Image(image: NetworkImage(link2))
                // Image.network(await record.image.getDownloadURL()),
                // Image.network(Uri.parse(await ref.getDownloadURL() as String)),//(record.image),

                // Image.network(loadImage()),

                // Text(record.image)
              ]),
            )

            // getImage(context, record.image.toString());
          ],
        ),
      ),
      /* decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.wifi.toString()),
          onTap: () => print(record),
          onTap: () => record.reference.updateData({'votes': record.votes + 1})
        ), */
    );
  }

  String wifi(bool string) {
    if (string == true) {
      return "Wifi";
    } else {
      return "No Wifi";
    }
  }

  String pool(bool string) {
    if (string == true) {
      return "Pool";
    } else {
      return "No Pool";
    }
  }

  String price(int string) {
    return convertToIdr(string, 0);
  }

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService._();
  FireStorageService();

  static Future<dynamic> loadFromStorage(BuildContext context, String image) {
    print('---> here 4');
    throw ("Platform not found");
  }
}

class Record {
  final String name;
  final int price;
  final bool wifi;
  final bool pool;
  final double review;
  var image;
  final DocumentReference? reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['price'] != null),
        assert(map['wifi'] != null),
        assert(map['pool'] != null),
        assert(map['review'] != null),
        assert(map['image'] != null),
        name = map['name'],
        price = map['price'],
        wifi = map['wifi'],
        pool = map['pool'],
        review = map['review'],
        image = map['image'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$image>";
}
