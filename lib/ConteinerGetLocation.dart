import 'package:booking_hotel/ListNamaKota.dart';
import 'package:flutter/material.dart';
import 'string_casting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContainerGetLocation extends StatefulWidget {
  const ContainerGetLocation({super.key});

  @override
  State<ContainerGetLocation> createState() => _ContainerGetLocationState();
}

class _ContainerGetLocationState extends State<ContainerGetLocation> {
  late TextEditingController _controllerLocation;
  late String location;

  addStringToSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', value);
  }

  @override
  void initState() {
    super.initState();
    _controllerLocation = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    String msg = "Mau pesen hotel dimana?";
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
        child: TextField(
          controller: _controllerLocation,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: Colors.blue,
            ),
            hintText: "Mau pesen hotel dimana?",
          ),
          onTap: (() {
            ShowLocationList();
          }), //
        ));
  }

  ShowLocationList() {
    TextEditingController editingController = TextEditingController();
    var filter = "";
    List<String> asli = ListNamaKota().arrNamaKota;
    List<String> hurufKecilSemua = <String>[];
    for (String kopi in asli) {
      hurufKecilSemua.add(kopi.toLowerCase());
    }

    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(asli);

    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
              initialChildSize: 1, //set this as you want
              maxChildSize: 1, //set this as you want
              minChildSize: 1, //set this a
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(children: <Widget>[
                  Icon(
                    Icons.remove,
                    color: Colors.grey[600],
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: editingController,
                        onChanged: (value) {
                          value = value.toLowerCase();
                          List<String> listDumy =
                              List<String>.of(hurufKecilSemua);
                          if (value.isNotEmpty) {
                            listDumy.retainWhere(
                                (element) => element.startsWith(value));
                          }
                          dummySearchList.clear();
                          dummySearchList.addAll(listDumy);

                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Kota Tujuan atau Nama Hotel",
                            prefixIcon: Icon(Icons.search)),
                      )),
                  Expanded(
                    child: ListView.separated(
                        controller: scrollController,
                        itemCount: dummySearchList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                print(dummySearchList[index].toTitleCase());
                                _controllerLocation.text =
                                    dummySearchList[index].toTitleCase();

                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  dummySearchList[index].toTitleCase(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15), //
                                  textAlign: TextAlign.left,
                                ),
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider()),
                  )
                ]);
              });
        });
      },
    );
  }
}
