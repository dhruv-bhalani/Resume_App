import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  List<String> alllanguages = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Punjabi",
    "Bengali",
    "Tamil",
    "Telugu",
    "Malayalam",
  ];

  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Personal Details"),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "DOB",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
                7.height,
                Row(
                  children: [
                    Text(
                      date != null
                          ? DateFormat('dd/MM/yyyy').format(
                              date!,
                            )
                          : 'DD/MM/YYYY',
                    ),
                    IconButton(
                      onPressed: () async {
                        date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.now(),
                        );

                        setState(() {});
                      },
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
                7.height,
                Row(
                  children: [
                    Text("Marital StatusM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[900],
                        )),
                  ],
                ),
                7.height,
                RadioListTile(
                    title: Text("Single"),
                    value: "Single",
                    groupValue: Globals.gender,
                    onChanged: (val) {
                      Globals.gender = val;
                      setState(() {});
                    }),
                RadioListTile(
                    title: Text("Married"),
                    value: "Married",
                    groupValue: Globals.gender,
                    onChanged: (val) {
                      Globals.gender = val;
                      setState(() {});
                    }),
                7.height,
                Row(
                  children: [
                    Text(
                      "Languages Known",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
                7.height,
                ...alllanguages.map(
                  (e) => CheckboxListTile(
                    title: Text(e),
                    value: Globals.languages.contains(e),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      if (val!) {
                        Globals.languages.add(e);
                      } else {
                        Globals.languages.remove(e);
                      }
                      setState(() {});
                    },
                  ),
                ),
                7.height,
                Row(
                  children: [
                    Text(
                      "Nationality",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
                7.height,
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Indian",
                    border: OutlineInputBorder(),
                  ),
                ),
                20.height,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    // text color
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
