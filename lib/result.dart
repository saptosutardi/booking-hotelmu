import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ContainerResultSubHeader.dart';

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
        bottom: const PreferredSize(
          preferredSize: Size(0, 20),
          child: ContainerSubHeader(),
        ),
      ),
      body: MyStatelessWidget(),
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

  /* Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, dummySnapshot);
  } */

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('data_hotel').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
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
      child: Container(
        child: Card(
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
              Column(children: [
                Text(record.name),
                Text(record.wifi.toString()),
                Text(record.pool.toString()),
                Text(record.review.toString()),
                Text(record.price.toString()),
              ]),
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
      ),
    );
  }
}

class Record {
  final String name;
  final int price;
  final bool wifi;
  final bool pool;
  final double review;
  final DocumentReference? reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['price'] != null),
        assert(map['wifi'] != null),
        assert(map['pool'] != null),
        assert(map['review'] != null),
        name = map['name'],
        price = map['price'],
        wifi = map['wifi'],
        pool = map['pool'],
        review = map['review'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$price:$wifi>";
}
