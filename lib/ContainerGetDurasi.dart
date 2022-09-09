import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContainerGetDurasi extends StatefulWidget {
  const ContainerGetDurasi({super.key});

  @override
  State<ContainerGetDurasi> createState() => _ContainerGetDurasiState();
}

class _ContainerGetDurasiState extends State<ContainerGetDurasi> {
  late TextEditingController _controllerLamaMenginap;

  @override
  void initState() {
    super.initState();
    _controllerLamaMenginap = TextEditingController();
  }

  int lamaMenginap = 1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controllerLamaMenginap,
      decoration: InputDecoration(
          // border: const UnderlineInputBorder(),
          hintText: "$lamaMenginap malam",
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          )),
      onTap: () {
        listDurasi(_controllerLamaMenginap);
      },
    );
  }

  listDurasi(TextEditingController controller) async {
    final arrIntLamaMenginap = <int>[];
    final arrStringLamaMenginap = <String>[];
    final arrStringTanggalCheckOut = <String>[];
    for (int i = 1; i < 31; i++) {
      arrIntLamaMenginap.add(i);
      arrStringLamaMenginap.add("$i malam");
    }

    final DateFormat formatter = DateFormat('EE, dd MMM yyyy', 'id_ID');

    final DateTime today = DateTime.now();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('stringValue');

    DateTime? newDate = DateTime.parse(stringValue.toString());
    DateTime mulaiMenginap;
    if (stringValue?.length != 0) {
      mulaiMenginap = newDate;
    } else {
      mulaiMenginap = today;
    }

    for (int i = 0; i < 30; i++) {
      final DateTime startDate = mulaiMenginap.subtract(Duration(days: i));
      print(startDate);
      final String start = formatter.format(startDate);
      arrStringTanggalCheckOut.add("Check-out: $start");
    }

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
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(children: <Widget>[
                  Icon(
                    Icons.remove,
                    color: Colors.grey[600],
                  ),
                  Expanded(
                    child: ListView.separated(
                        controller: scrollController,
                        itemCount: arrStringLamaMenginap.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    lamaMenginap = index + 1;
                                    controller.text = "$lamaMenginap malam";
                                    // print(lamaMenginap);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        arrStringLamaMenginap[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(arrStringTanggalCheckOut[index],
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.left),
                                  ],
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
