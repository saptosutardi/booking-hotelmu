import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContainerGetCheckIn extends StatefulWidget {
  const ContainerGetCheckIn({
    super.key,
  });

  @override
  State<ContainerGetCheckIn> createState() => ContainerGetCheckInState();
}

class ContainerGetCheckInState extends State<ContainerGetCheckIn> {
  late TextEditingController controllerTanggalCheckIn;
  late TextEditingController contA;

  addStringToSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', value);
  }

  @override
  void initState() {
    super.initState();
    controllerTanggalCheckIn = TextEditingController();
  }

  var tanggalHariIni = getDate();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, right: 20),
      child: TextField(
        controller: controllerTanggalCheckIn,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          prefixIcon: const Icon(
            Icons.calendar_month,
            color: Colors.blue,
          ),
          hintText: tanggalHariIni,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        onTap: () {
          _selectDate(context, controllerTanggalCheckIn);
        },
      ),
    );
  }

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context,
      TextEditingController controllerTanggalCheckIn) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        locale: const Locale("id", "ID"),
        initialDate: currentDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        controllerTanggalCheckIn.text = DateFormat('EE, dd MMM yyyy', "id_ID")
            .format(pickedDate)
            .toString();
        addStringToSF(pickedDate.toString());
      });
    }
  }

  static getDate() {
    return DateFormat('EE, dd MMM yyyy', 'id_ID')
        .format(DateTime.now())
        .toString();
  }
}
