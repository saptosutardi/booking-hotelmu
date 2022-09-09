import 'package:flutter/material.dart';

class ContainerGetkamarDanTamu extends StatefulWidget {
  const ContainerGetkamarDanTamu({super.key});

  @override
  State<ContainerGetkamarDanTamu> createState() =>
      _ContainerGetkamarDanTamuState();
}

class _ContainerGetkamarDanTamuState extends State<ContainerGetkamarDanTamu> {
  late TextEditingController _controllerJumlahKamarOrang;
  late TextEditingController _controllerJumlahKamar;
  late TextEditingController _controllerJumlahOrang;
  @override
  void initState() {
    super.initState();
    _controllerJumlahKamarOrang = TextEditingController();
    _controllerJumlahKamar = TextEditingController();
    _controllerJumlahOrang = TextEditingController();
  }

  int _kamarState = 1;
  int _jumTamuState = 1;
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      child: TextField(
        controller: _controllerJumlahKamarOrang,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          prefixIcon: const Icon(
            Icons.person_add_alt_1,
            color: Colors.blue,
          ),
          hintText: "$_kamarState Kamar, $_jumTamuState Tamu",
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: () {
          jumlahKamarOrang(_controllerJumlahKamar, _controllerJumlahOrang);
        },
      ),
    );
  }

  void jumlahKamarOrang(TextEditingController controllerJumlahKamarOrang,
      TextEditingController controllerJumlahKamarOrang2) {
    showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, state) {
          return Column(children: [
            Icon(
              Icons.remove,
              color: Colors.grey[600],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text("Kamar"),
                  const Spacer(),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_kamarState > 1) {
                            kurangiRuangan(state);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      Text(
                        '$_kamarState',
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_kamarState < 10) {
                            tambahKamar(state);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text("Total Tamu"),
                  const Spacer(),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_jumTamuState > 1) {
                            kurangiTamu(state);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                      Text(
                        '$_jumTamuState',
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (_jumTamuState < (_kamarState * 2)) {
                            tambahTamu(state);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(18),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[900],
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('SIMPAN',
                            style: TextStyle(fontSize: 15)))))
          ]);
        });
      },
    );
  }

  Future<void> kurangiRuangan(StateSetter updateState) async {
    updateState(() {
      _kamarState--;
    });
  }

  Future<void> tambahKamar(StateSetter updateState) async {
    updateState(() {
      _kamarState++;
    });
  }

  Future<void> kurangiTamu(StateSetter updateState) async {
    updateState(() {
      _jumTamuState--;
    });
  }

  Future<void> tambahTamu(StateSetter updateState) async {
    updateState(() {
      _jumTamuState++;
    });
  }
}
