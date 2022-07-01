import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/reptiles.dart';

class AddRep extends StatefulWidget {
  final DateTime? selectedDate;
  const AddRep({Key? key, this.selectedDate}) : super(key: key);

  @override
  State<AddRep> createState() => _AddRepState();
}

class _AddRepState extends State<AddRep> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add rep"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: decoration('name'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerAge,
            decoration: decoration('age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          // DateTimeField(
          //   controller: controllerDate,
          //   decoration: decoration("date"),
          //   format: DateFormat("yyyy-MM-dd"),
          //   onShowPicker: (context, currentValue) {
          //     return showDatePicker(
          //         context: context,
          //         initialDate: widget.selectedDate ?? DateTime.now(),
          //         // initialDate: currentValue ?? widget.selectedDate!,
          //         firstDate: DateTime(1990),
          //         lastDate: DateTime(2100));
          //   },
          // ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final rep = Reptiles(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                bday: widget.selectedDate ?? DateTime.now(),
              );

              Reptiles.createReptile(rep);
              // addCollection();

              Navigator.pop(context);
            },
            child: Text("create"),
          )
        ],
      ),
    );
  }
}
